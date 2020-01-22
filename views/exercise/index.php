<?php

/* @var $this yii\web\View */

$this->title = 'My Yii Application';
?>
<header class="demos-header" style="padding: 35px 0;text-align:center;">
    <h1 class="demos-title"><?= Yii::$app->user->identity->username . "的学习任务"?></h1>
    <h2 class="weui-msg__title">离合格考还有<?= round((strtotime("2020-06-30")-strtotime(date("Y-m-d")))/86400)?>天</h2>
</header>

<div class="weui-panel">
<?php if (is_array($task)) { ?>
    <div class="weui-panel__hd">寒假作业</div>
    <?php foreach ($task as $value) {?>
    <div class="weui-panel__bd">
        <a href="<?= "/problem/show?p_id=" . $value['first_pid'] ?>"
           class="weui-media-box weui-media-box_appmsg">
        <div class="weui-media-box weui-media-box_text">
            <h4 class="weui-media-box__title"><?= $value['task_name']?></h4>
            <p class="weui-media-box__desc"><?= $value['content']?></p>
            <ul class="weui-media-box__info">
                <li class="weui-media-box__info__meta">开始时间：<?= $value['from_time']?></li>
                <li class="weui-media-box__info__meta">结束时间：<?= $value['end_time']?></li>
            </ul>
        </div>
        </a>
    </div>
    <?php } ?>
<?php } ?>
</div>