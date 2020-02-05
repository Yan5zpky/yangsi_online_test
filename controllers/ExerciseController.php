<?php

namespace app\controllers;

use app\models\User;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use Yii;
use yii\filters\AccessControl;
use yii\helpers\ArrayHelper;
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

    public function actionAnalysis()
    {
        $examId = Yii::$app->request->getQueryParam('e_id');
        $examInfo = Exercise::findOne($examId);
        // 获取题号
        $problemIds = Yii::$app->db->createCommand('SELECT p_id,answer FROM problem WHERE e_id = '.$examId.';')
            ->queryAll();
        $result = [];
        foreach ($problemIds as $value) {
            foreach (array('A','B','C','D') as $answer) {
                $posts = Yii::$app->db->createCommand('SELECT A.* FROM `stu_answer_log` A LEFT JOIN user U ON A.stu_id = U.id LEFT JOIN problem P ON P.p_id = A.p_id WHERE U.role = 2 AND A.p_id = '.$value['p_id'].' AND A.stu_answer = "'.$answer.'" GROUP BY A.stu_id,A.stu_answer;')
                    ->queryAll();
                $result[$value['p_id']][$answer] = count($posts);
            }
            $result[$value['p_id']]['correct_answer'] = $value['answer'];
        }
        $spreadsheet = new Spreadsheet();
        $worksheet = $spreadsheet->getActiveSheet();
        //设置工作表标题名称
        $worksheet->setTitle("正确率统计");

        //表头
        //设置单元格内容
        $worksheet->setCellValueByColumnAndRow(1, 1, $examInfo->name);
        $worksheet->setCellValueByColumnAndRow(1, 2, '题号');
        $worksheet->setCellValueByColumnAndRow(2, 2, '选A数');
        $worksheet->setCellValueByColumnAndRow(3, 2, '选A率');
        $worksheet->setCellValueByColumnAndRow(4, 2, '选B数');
        $worksheet->setCellValueByColumnAndRow(5, 2, '选B率');
        $worksheet->setCellValueByColumnAndRow(6, 2, '选C数');
        $worksheet->setCellValueByColumnAndRow(7, 2, '选C率');
        $worksheet->setCellValueByColumnAndRow(8, 2, '选D数');
        $worksheet->setCellValueByColumnAndRow(9, 2, '选D率');
        $worksheet->setCellValueByColumnAndRow(10, 2, '正确率');

        //合并单元格
        $worksheet->mergeCells('A1:J1');

        $styleArray = [
            'font' => [
                'bold' => true
            ],
            'alignment' => [
                'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
            ],
        ];
        //设置单元格样式
        $worksheet->getStyle('A1')->applyFromArray($styleArray)->getFont()->setSize(28);
        $worksheet->getStyle('A2:J2')->applyFromArray($styleArray)->getFont()->setSize(14);
        $len = count($result);$j = 3;
        foreach ($result as $key => $row) {
            if ($row['A']+$row['B']+$row['C']+$row['D'] == 0) {
                $aValue = $bValue = $cValue = $dValue = 0;
            } else {
                $aValue = round($row['A'] / ($row['A']+$row['B']+$row['C']+$row['D']) * 100) . "%";
                $bValue = round($row['B'] / ($row['A']+$row['B']+$row['C']+$row['D']) * 100) . "%";
                $cValue = round($row['C'] / ($row['A']+$row['B']+$row['C']+$row['D']) * 100) . "%";
                $dValue = round($row['D'] / ($row['A']+$row['B']+$row['C']+$row['D']) * 100) . "%";
            }
            if ($row['correct_answer'] == 'A') {
                $correctNum = $aValue;
            } else if ($row['correct_answer'] == 'B') {
                $correctNum = $bValue;
            } else if ($row['correct_answer'] == 'C') {
                $correctNum = $cValue;
            } else if ($row['correct_answer'] == 'D') {
                $correctNum = $dValue;
            } else {
                $correctNum = 0;
            }
            $worksheet->setCellValueByColumnAndRow(1, $j, $j-2);
            $worksheet->setCellValueByColumnAndRow(2, $j, $row['A']);
            $worksheet->setCellValueByColumnAndRow(3, $j, $aValue);
            $worksheet->setCellValueByColumnAndRow(4, $j, $row['B']);
            $worksheet->setCellValueByColumnAndRow(5, $j, $bValue);
            $worksheet->setCellValueByColumnAndRow(6, $j, $row['C']);
            $worksheet->setCellValueByColumnAndRow(7, $j, $cValue);
            $worksheet->setCellValueByColumnAndRow(8, $j, $row['D']);
            $worksheet->setCellValueByColumnAndRow(9, $j, $dValue);
            $worksheet->setCellValueByColumnAndRow(10, $j, $correctNum);
            $j++;
        }

        $styleArrayBody = [
            'borders' => [
                'allBorders' => [
                    'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                    'color' => ['argb' => '666666'],
                ],
            ],
            'alignment' => [
                'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
            ],
        ];
        $total_rows = $len + 2;
        //添加所有边框/居中
        $worksheet->getStyle('A1:J'.$total_rows)->applyFromArray($styleArrayBody);

        // 第二张worksheet
        $secondWorkSheet = new \PhpOffice\PhpSpreadsheet\Worksheet\Worksheet($spreadsheet, '学生成绩');
        $spreadsheet->addSheet($secondWorkSheet, 1);//将"My Data"工作表作为电子表格对象中的第一个工作表附加
        // 做题情况
        $sqlResult = Yii::$app->db->createCommand('SELECT
            U.class,
            U.id,
            U.username,
            E.e_id,
            LOG.p_id,
            LOG.stu_answer,
            P.answer
        FROM
            `user` U
        LEFT JOIN stu_answer_log LOG ON LOG.stu_id = U.id
        LEFT JOIN problem P ON LOG.p_id = P.p_id
        LEFT JOIN exercise E ON E.e_id = P.e_id
        WHERE
            U.role = 2
        AND (E.e_id = '.$examId.')
        GROUP BY
            U.id,
            LOG.p_id
        ORDER BY
            U.class,
            U.id,
	        LOG.p_id;')
            ->queryAll();
        $answerResult = ArrayHelper::map($sqlResult, 'p_id', 'stu_answer','id'); // 每个学生的答题情况
        $sqlResult = User::find()
            ->where(['role' => 2])
            ->asArray()
            ->all();
        $studentInfo = ArrayHelper::map($sqlResult, 'id', 'username'); // 学生姓名
        $classInfo = ArrayHelper::map($sqlResult, 'id', 'class'); // 学生属于哪个班级
        $sqlResult = Problem::find()
            ->where(['e_id' => $examId])
            ->asArray()
            ->all();
        $problemInfo = ArrayHelper::map($sqlResult, 'p_id', 'answer'); // 正确答案
        $problemInfoCount = count($problemInfo); // 正确答案
        $sheetInfo = [];
        $sheetIndex = 0;
        foreach ($studentInfo as $studentId => $name) {
            $sheetInfo[$sheetIndex]['class'] = $classInfo[$studentId];
            $sheetInfo[$sheetIndex]['name'] = $studentInfo[$studentId];
            $answerCorrectNum = 0;

            if (!array_key_exists($studentId, $answerResult)) { // 未作答
                $sheetInfo[$sheetIndex]['submit_num'] = 0;
            } else {
                $studentAnswerInfo = $answerResult[$studentId];
                foreach ($studentAnswerInfo as $problemId => $stuAnswer) { // 统计正确率
                    $sheetInfo[$sheetIndex]['submit_num'] = count($studentAnswerInfo);
                    if ($problemId == null) { // 未答题
                        $sheetInfo[$sheetIndex]['submit_num'] = 0;
                        break;
                    }
                    if ($stuAnswer == $problemInfo[$problemId]) { // 正确
                        $answerCorrectNum++;
                    }
                }
            }
            $sheetInfo[$sheetIndex]['answer_correct_num'] = $answerCorrectNum;
            $sheetInfo[$sheetIndex]['all_num'] = $problemInfoCount;
            $sheetInfo[$sheetIndex]['score'] = $answerCorrectNum."/".$problemInfoCount;

            $sheetIndex++;
        }
        //表头
        //设置单元格内容
        $secondWorkSheet->setCellValueByColumnAndRow(1, 1, '班级');
        $secondWorkSheet->setCellValueByColumnAndRow(2, 1, '姓名');
        $secondWorkSheet->setCellValueByColumnAndRow(3, 1, '题目总数');
        $secondWorkSheet->setCellValueByColumnAndRow(4, 1, '提交总数');
        $secondWorkSheet->setCellValueByColumnAndRow(5, 1, '正确数');
        $secondWorkSheet->setCellValueByColumnAndRow(6, 1, '正确率');
        $secondWorkSheet->getDefaultColumnDimension()->setWidth(12);

//        //合并单元格
//        $worksheet->mergeCells('A1:J1');

        $styleArray = [
            'font' => [
                'bold' => true
            ],
            'alignment' => [
                'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
            ],
        ];
        //设置单元格样式
        $secondWorkSheet->getStyle('A1:F1')->applyFromArray($styleArray)->getFont()->setSize(14);
        $len = count($sheetInfo);$j = 2;
        foreach ($sheetInfo as $key => $row) {
            $secondWorkSheet->setCellValueByColumnAndRow(1, $j, $row['class']);
            $secondWorkSheet->setCellValueByColumnAndRow(2, $j, $row['name']);
            $secondWorkSheet->setCellValueByColumnAndRow(3, $j, $row['all_num']);
            $secondWorkSheet->setCellValueByColumnAndRow(4, $j, $row['submit_num']);
            $secondWorkSheet->setCellValueByColumnAndRow(5, $j, $row['answer_correct_num']);
            $secondWorkSheet->setCellValueByColumnAndRow(6, $j, $row['score']);
            $j++;
        }

        $total_rows = $len + 1;
        //添加所有边框/居中
        $secondWorkSheet->getStyle('A1:F'.$total_rows)->applyFromArray($styleArrayBody);

        $filename = $examInfo->name.'.xlsx';
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment;filename="'.$filename.'"');
        header('Cache-Control: max-age=0');

        $writer = \PhpOffice\PhpSpreadsheet\IOFactory::createWriter($spreadsheet, 'Xlsx');
        $writer->save('php://output');
        exit;

    }

}
