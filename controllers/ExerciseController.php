<?php

namespace app\controllers;

use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\Response;
use yii\filters\VerbFilter;
use app\models\LoginForm;
use app\models\ContactForm;
use app\models\Exercise;
use app\models\Problem;
use app\models\Subject;
use app\models\StuTask;

class ExerciseController extends Controller
{
    public $layout = "weui"; // 使用weui作布局
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    /**
     * Displays all exercises.
     *
     * @return string
     */
    public function actionAll()
    {
        // 获取 cache 组件
        $cache = Yii::$app->cache;
        $key = "all_exercise";

        if ($cache->exists($key)) {
//        if (false) {
            $all = $cache->get($key);
        } else {
            $exercises = Exercise::find()
                ->where(['is_active' => Exercise::STATUS_ACTIVE])
                ->asArray()
                ->all();
            $all = [];
            $subject = Subject::find()
                ->where(['is_active' => Subject::STATUS_ACTIVE])
                ->asArray()
                ->all();
            $subjectArray = [];
            foreach ($subject as $value) {
                $subjectArray[$value['s_id']] = $value['subject'];
            }
            foreach ($exercises as $exercise) {
                $all[$subjectArray[$exercise['s_id']]][] = $exercise;
            }
            $cache->set($key, $all, 86400);
        }


        return $this->render('all', ['exercises' => $all]);
    }

    public function actionIndex()
    {
        $task = StuTask::find()
            ->where(['<=', 'from_time', date('Y-m-d H:i:s')])
            ->andWhere(['>=', 'end_time',date('Y-m-d H:i:s')])
            ->andWhere(['is_active' => StuTask::STATUS_ACTIVE])
            ->asArray()
            ->all();
        foreach ($task as $key => $value) {
            $exercise = Exercise::find()
                ->where(['e_id' => $value['e_id']])
//                ->andWhere((['is_active' => Exercise::STATUS_ACTIVE]))
                ->asArray()
                ->one();
            $task[$key]['first_pid'] = $exercise['first_pid'];
        }

        return $this->render('index', ['task' => $task]);
    }

}
