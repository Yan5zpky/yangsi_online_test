<?php

namespace app\controllers;

use app\models\Exercise;
use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\Response;
use yii\filters\VerbFilter;
use app\models\Problem;
use app\models\Problemimg;
use app\models\StuAnswerLog;

class ProblemController extends Controller
{

    public $layout = "weui"; // 使用weui作布局
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        $this->enableCsrfValidation = false;
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
     * Displays problem.
     *
     * @return string
     */
    public function actionShow()
    {
        $problemId = Yii::$app->request->getQueryParam('p_id');
        // 获取 cache 组件
        $cache = Yii::$app->cache;
        $key = "problem_".$problemId."_info";
        if ($cache->exists($key)) {
            $result = $cache->get($key);
        } else {
            $problem = Problem::find()
                ->where(['p_id' => $problemId])
                ->one();
            if (!empty($problem)) {
                $nextProblem = Problem::find()
                    ->where(['e_id' => $problem->e_id])
                    ->andWhere(['xuhao' => $problem->xuhao + 1])
                    ->one();
            }
            if (!empty($nextProblem)) { // 下一道题的序号
                $nextPid = $nextProblem->p_id;
            } else {
                $nextPid = null; //最后一题
            }
            $exerciseType = Exercise::findOne($problem->e_id); // 测试类型
            // 题目图片
            $problemImg = Problemimg::find()
                ->where(['p_id' => $problem->p_id])
                ->andWhere(['is_active' => Problemimg::STATUS_ACTIVE])
                ->all();
            // 做题进度
            $exerciseCount = Problem::find()
                ->where(['e_id' => $problem->e_id])
                ->count('p_id');
            $progress = round($problem->xuhao / $exerciseCount * 100);
            $xuhaoProgress = $problem->xuhao ."/".$exerciseCount;
            $result = ['problem' => $problem, 'next_pid' => $nextPid, 'problem_img' => $problemImg, 'progress' => $progress, 'xuhaoProgress'=>$xuhaoProgress, "exerciseType" => $exerciseType->type];
            $cache->set($key, $result, 86400);
        }

        return $this->render('show', $result);
    }

    /**
     * 纪录学生的答题情况
     */
    public function actionAnswer()
    {
        Yii::$app->response->format=Response::FORMAT_JSON;
        if (Yii::$app->request->isPost) {
            $request = Yii::$app->request;
            $choice = $request->post('choice');
            $pid = $request->post('pid');
            if ($choice != null) {
                $recordLog = new StuAnswerLog();
                $recordLog->p_id = $pid;
                $recordLog->stu_id = Yii::$app->user->id;
                $recordLog->stu_answer = $choice;
                $recordLog->is_active = 1;
                $recordLog->save();
                return ['code' => 200, 'message' => "success"];
            }
        }
        return ['code' => 200, 'message' => 'false'];
    }


}
