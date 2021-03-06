<?php

/* @var $this \yii\web\View */
/* @var $content string */

use app\widgets\Alert;
use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use app\assets\LayuiAsset;

LayuiAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>管理系统后台</title>
    <link rel="stylesheet" href="/js/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">在线做题系统后台</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
<!--        <ul class="layui-nav layui-layout-left">-->
<!--            <li class="layui-nav-item"><a href="">控制台</a></li>-->
<!--            <li class="layui-nav-item"><a href="">商品管理</a></li>-->
<!--            <li class="layui-nav-item"><a href="">用户</a></li>-->
<!--            <li class="layui-nav-item">-->
<!--                <a href="javascript:;">其它系统</a>-->
<!--                <dl class="layui-nav-child">-->
<!--                    <dd><a href="">邮件管理</a></dd>-->
<!--                    <dd><a href="">消息管理</a></dd>-->
<!--                    <dd><a href="">授权管理</a></dd>-->
<!--                </dl>-->
<!--            </li>-->
<!--        </ul>-->
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    <?= Yii::$app->user->identity->username?>
                </a>
<!--                <dl class="layui-nav-child">-->
<!--                    <dd><a href="">基本资料</a></dd>-->
<!--                    <dd><a href="">安全设置</a></dd>-->
<!--                </dl>-->
            </li>
            <li class="layui-nav-item"><a href="/admin/logout" data-method="post">注销</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">系统管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/admin/student">班级学生</a></dd>
                        <dd><a href="/admin/addstudent">添加学生</a></dd>
<!--                        <dd><a href="javascript:;">列表三</a></dd>-->
<!--                        <dd><a href="">超链接</a></dd>-->
                    </dl>
                </li>
                <li class="layui-nav-item layui-nav-itemed">
                    <a href="javascript:;">学情分析</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/admin/exam">题库列表</a></dd>
                        <dd><a href="/admin/newtask">创建任务</a></dd>
<!--                        <dd><a href="javascript:;">导入题库</a></dd>-->
<!--                        <dd><a href="">超链接</a></dd>-->
                    </dl>
                </li>
<!--                <li class="layui-nav-item"><a href="">云市场</a></li>-->
<!--                <li class="layui-nav-item"><a href="">发布商品</a></li>-->
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;"><?= $content ?></div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © Yangsi Senior High School
    </div>
</div>
</body>
</html>
<?php $this->endPage() ?>
