<?php
/**
 * @link http://www.yiiframework.com/
 * @copyright Copyright (c) 2008 Yii Software LLC
 * @license http://www.yiiframework.com/license/
 */

namespace app\assets;

use yii\web\AssetBundle;

/**
 * Main application asset bundle.
 *
 * @author Qiang Xue <qiang.xue@gmail.com>
 * @since 2.0
 *
 */
class WeuiAsset extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web';
    public $css = [
        '//res.wx.qq.com/open/libs/weui/1.1.3/weui.min.css',
        '//cdn.bootcss.com/jquery-weui/1.2.1/css/jquery-weui.min.css',
    ];
    public $js = [
        '//cdn.bootcss.com/jquery/1.11.0/jquery.min.js',
        '//cdn.bootcss.com/jquery-weui/1.2.1/js/jquery-weui.min.js',
//        '//www.jqweui.cn/dist/js/swiper.js',
    ];
    public $depends = [
//        'yii\web\YiiAsset',
//        'yii\bootstrap\BootstrapAsset',
    ];
}
