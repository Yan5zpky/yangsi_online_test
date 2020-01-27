<?php

namespace app\controllers;

use yii;
use yii\web\Controller;

class CrontabController extends Controller
{
    public function actionFlush()
    {
        dd(Yii::$app->cache->flush());
    }
}