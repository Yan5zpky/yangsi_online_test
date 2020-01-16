<?php
namespace app\models;

use yii\db\ActiveRecord;

class StuTask extends ActiveRecord
{
    const STATUS_INACTIVE = 0;
    const STATUS_ACTIVE = 1;

    /**
     * @return string Active Record 类关联的数据库表名称
     */
    public static function tableName()
    {
        return '{{stu_task}}';
    }
}