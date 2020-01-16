<?php
//dd(is_array($exercises));
?>
<?php if (is_array($exercises)) {
    foreach ($exercises as $subject => $exercise) { ?>
        <div class="weui-panel weui-panel_access">
            <div class="weui-panel__hd"><?= $subject?></div>
            <div class="weui-panel__bd">
                <?php if (is_array($exercise)) {
                    foreach ($exercise as $value) { ?>
                        <a href="<?= "/problem/show?p_id=" . $value['first_pid'] ?>"
                           class="weui-media-box weui-media-box_appmsg">
                            <div class="weui-media-box__hd">
                                <img class="weui-media-box__thumb" src="/images/school.jpg">
                            </div>
                            <div class="weui-media-box__bd">
                                <h4 class="weui-media-box__title"><?= $value['name'] ?>&nbsp;
<!--                                    <font color="red">正确率12/33</font>-->
                                </h4>
                                <p class="weui-media-box__desc"><?= $value['content'] ?></p>
                            </div>
                        </a>
                    <?php }
                } ?>
            </div>
        </div>
        <?php
    }
}    ?>
