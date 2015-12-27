<?php

namespace app\models\base;

use Yii;

/**
 * This is the model class for table "phongkham".
 *
 * @property integer $id
 * @property integer $maKhoa
 * @property string $tenPK
 * @property string $moTa
 *
 * @property BenhnhanPhongkham[] $benhnhanPhongkhams
 * @property Khoa $maKhoa0
 */
class Phongkham extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'phongkham';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['maKhoa', 'tenPK', 'moTa'], 'required'],
            [['maKhoa'], 'integer'],
            [['moTa'], 'string'],
            [['tenPK'], 'string', 'max' => 255]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'maKhoa' => 'Mã khoa',
            'tenPK' => 'Tên phòng khám',
            'moTa' => 'Mô tả',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBenhnhanPhongkhams()
    {
        return $this->hasMany(BenhnhanPhongkham::className(), ['maPK' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMaKhoa0()
    {
        return $this->hasOne(Khoa::className(), ['id' => 'maKhoa']);
    }
}
