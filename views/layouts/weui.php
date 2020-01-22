<?php

/* @var $this \yii\web\View */
/* @var $content string */

use app\widgets\Alert;
use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use app\assets\WeuiAsset;

WeuiAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?php $this->registerCsrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
    <script type="text/javascript" src="//cdn.bootcss.com/jquery/1.11.0/jquery.js"></script>
</head>
<body>
<?php $this->beginBody() ?>

<div class="wrap">
    <div class="weui-tab">
        <div class="weui-tab__bd">
            <div id="tab1" class="weui-tab__bd-item weui-tab__bd-item--active">
                <?= Breadcrumbs::widget([
                    'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
                ]) ?>
                <?= Alert::widget() ?>
                <?= $content ?>
            </div>
        </div>
    </div>
</div>

<?php if (!Yii::$app->user->isGuest) { ?>
<div class="weui-tabbar">
    <a href="/" class="weui-tabbar__item weui-bar__item--on">
        <div class="weui-tabbar__icon">
            <img src="/images/icon_nav_button.png" alt="">
        </div>
        <p class="weui-tabbar__label">主页</p>
    </a>
    <a href="javascript:;" class="weui-tabbar__item">
        <div class="weui-tabbar__icon">
            <img src="/images/icon_nav_msg.png" alt="">
        </div>
        <p class="weui-tabbar__label">通讯录</p>
    </a>
    <a href="/exercise/all" class="weui-tabbar__item">
        <span class="weui-badge" style="position: absolute;top: -.4em;right: 1em;">1</span>
        <div class="weui-tabbar__icon">
            <img src="/images/icon_nav_article.png" alt="">
        </div>
        <p class="weui-tabbar__label">题库</p>
    </a>
    <a href="javascript:;" class="weui-tabbar__item">
        <div class="weui-tabbar__icon">
            <img src="/images/icon_nav_cell.png" alt="">
        </div>
        <p class="weui-tabbar__label">我</p>
    </a>
</div>
<?php } ?>
<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
