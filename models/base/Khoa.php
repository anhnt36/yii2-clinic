<?php

namespace app\models\base;

use Yii;

/**
 * This is the model class for table "khoa".
 *
 * @property integer $id
 * @property string $tenKhoa
 * @property string $moTa
 *
 * @property Nhanvien[] $nhanviens
 * @property Phongkham[] $phongkhams
 */
class Khoa extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'khoa';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['tenKhoa', 'moTa'], 'required'],
            [['moTa'], 'string'],
            [['tenKhoa'], 'string', 'max' => 255]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'tenKhoa' => 'Tên khoa',
            'moTa' => 'Mô tả',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getNhanviens()
    {
        return $this->hasMany(Nhanvien::className(), ['maKhoa' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPhongkhams()
    {
        return $this->hasMany(Phongkham::className(), ['maKhoa' => 'id']);
    }
}
