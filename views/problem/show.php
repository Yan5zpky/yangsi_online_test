<?php

?>
<div class="weui-slider-box" id="slider1">
    <div class="weui-slider">
        <div id="sliderInner" class="weui-slider__inner">
            <div id="sliderTrack" style="width: <?= $progress?>%;" class="weui-slider__track"></div>
            <div id="sliderHandler" style="left: <?= $progress?>%;" class="weui-slider__handler"></div>
        </div>
    </div>
    <div id="sliderValue" class="weui-slider-box__value"><?= $xuhaoProgress?></div>
</div>
<div class="weui-msg__text-area">
    <h2 class="weui-msg__title">选择题</h2>
    <p class="weui-msg__desc"><?= $problem->content ?></p>
</div>
<div class="weui-cells weui-cells_checkbox">
    <?php if ($problem->fill_blank == null) { ?>
    <label class="weui-cell weui-check__label" for="a_option">
        <div class="weui-cell__hd">
            <input type="radio" class="weui-check" name="checkbox1" id="a_option" onclick="answer()">
            <i class="weui-icon-checked"></i>
        </div>
        <div class="weui-cell__bd">
            <p><?= $problem->A_option ?></p>
        </div>
    </label>
    <label class="weui-cell weui-check__label" for="b_option">
        <div class="weui-cell__hd">
            <input type="radio" name="checkbox1" class="weui-check" id="b_option" onclick="answer()">
            <i class="weui-icon-checked"></i>
        </div>
        <div class="weui-cell__bd">
            <p><?= $problem->B_option ?></p>
        </div>
    </label>
    <label class="weui-cell weui-check__label" for="c_option">
        <div class="weui-cell__hd">
            <input type="radio" name="checkbox1" class="weui-check" id="c_option" onclick="answer()">
            <i class="weui-icon-checked"></i>
        </div>
        <div class="weui-cell__bd">
            <p><?= $problem->C_option ?></p>
        </div>
    </label>
    <label class="weui-cell weui-check__label" for="d_option">
        <div class="weui-cell__hd">
            <input type="radio" name="checkbox1" class="weui-check" id="d_option" onclick="answer()">
            <i class="weui-icon-checked"></i>
        </div>
        <div class="weui-cell__bd">
            <p><?= $problem->D_option ?></p>
        </div>
    </label>
    <?php } ?>
    <?php if ($problem_img != null) { ?>
    <a href="javascript:;" class="weui-btn weui-btn_primary" style="width:50%;" id="pb2">查看图片</a>
    <?php } ?>
    <?php if ($problem->fill_blank == 1) { ?>
        <div class="weui-cells__title">答案</div>
        <div class="weui-cells">
            <div class="weui-cell">
                <div class="weui-cell__bd">
                    <input class="weui-input" type="text" id="fill_blank" placeholder="请输入文本">
                </div>
            </div>
        </div>
        <a href="javascript:;" class="weui-btn weui-btn_primary" style="width:50%;" onclick="answer()">提交</a>
    <?php } ?>
</div>
<input type="hidden" value="<?= $problem->answer ?>" id="correct_answer">
<input type="hidden" value="<?= $problem->analysis ?>" id="analysis">
<input type="hidden" value="<?= $next_pid ?>" id="next">
<input type="hidden" value="<?= $problem->p_id ?>" id="current">
<script type='text/javascript' src="//www.jqweui.cn/dist/js/jquery-weui.js"></script>
<script type='text/javascript' src="/js/swiper.js"></script>
<!--<script src="https://cdn.bootcss.com/jquery-weui/1.2.1/js/city-picker.min.js"></script>-->
<script type="text/javascript" charset='utf-8'>
    correct = $("#correct_answer").val(); // 正确选项
    analysis = $("#analysis").val(); // 解析
    current = $("#current").val(); // 下一题
    next = $("#next").val(); // 下一题
    // console.log(correct);
    $('#slide1').slider(function (percent) {
        console.log(percent)
    })

    var pb2 = $.photoBrowser({
        items: [
        <?php foreach ($problem_img as $img) {?>
            {
                image: "<?= $img->img_url?>",
                caption: "<?= $img->img_des?>"
            },
        <?php } ?>
        ]
    });
    $("#pb2").click(function() {
        $(".weui-cells.weui-cells_checkbox").hide();
        pb2.open();
    });
    function answer() {
        if ($("#a_option").is(':checked')) { // 选了A
            choose_answer = "A";
        } else if ($("#b_option").is(':checked')) { // 选了B
            choose_answer = "B";
        } else if ($("#c_option").is(':checked')) { // 选了C
            choose_answer = "C";
        } else if ($("#d_option").is(':checked')) { // 选了D
            choose_answer = "D";
        } else {
            choose_answer = $("#fill_blank").val();
        }
        $.ajax(
            {
                url: "/problem/answer",
                type: "POST",
                dataType: "json",
                data: { choice: choose_answer, pid:current},
                success: function (result) {
                    console.log(result);
                },
                error: function (xhr, status, p3, p4) {
                    var err = "Error " + " " + status + " " + p3;
                    if (xhr.responseText && xhr.responseText[0] == "{")
                        err = JSON.parse(xhr.responseText).message;
                    console.log(err);
                }
            });
        correct = $("#correct_answer").val(); // 正确选项
        console.log(correct)
        if (correct == "") { // answer为空时只负责记录答题
            title = "提交成功";
        } else {
            if (choose_answer == correct) {
                title = "正确,答案为" + correct;
            } else {
                title = "错误,答案为" + correct;
            }
        }

        analysis = $("#analysis").val(); // 解析
        if (next == "") { // 没下一题
            buttonText = "做完了";
            hreflink = "/exercise/all";
        } else {
            buttonText = "下一题";
            hreflink = "/problem/show?p_id="+next;
        }
        $.modal({
            title: title,
            text: analysis,
            buttons: [
                { text: "再做一遍", className: "default", onClick: function(){ } },
                { text: buttonText, onClick: function(){window.location.href = hreflink;} },
            ]
        });
    }
</script>
<style>
    .photo-container img{
        width: 100%;
        max-height: 78%;
    }
</style>