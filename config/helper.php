<?php
if (!function_exists('dd')) {
    function dd(...$param)
    {
        foreach ($param as $p)  {
            \yii\helpers\VarDumper::dump($p, 10, true);
            echo '<pre>';
        }

        exit(1);
    }
}
