<?php

namespace app\models\base;

use Yii;

/**
 * This is the model class for table "duoc".
 *
 * @property integer $maDMThuoc
 * @property string $tenDMThuoc
 */
class Duoc extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'duoc';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['tenDMThuoc'], 'required'],
            [['tenDMThuoc'], 'string', 'max' => 255]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'maDMThuoc' => 'Mã danh mục thuốc',
            'tenDMThuoc' => 'Tên danh mục thuốc',
        ];
    }
}
