<?php

namespace app\models\base;

use Yii;

/**
 * This is the model class for table "benhnhan".
 *
 * @property integer $id
 * @property string $tenBN
 * @property string $ngaySinh
 * @property boolean $gioiTinh
 * @property string $ngheNghiep
 * @property string $danToc
 * @property string $diaChi
 * @property string $anh
 *
 * @property Hoso[] $hosos
 * @property Noitru[] $noitrus
 * @property Noitru[] $noitrus0
 */
class Benhnhan extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'benhnhan';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['tenBN', 'ngaySinh','gioiTinh'], 'required'],
            [['ngaySinh'], 'safe'],
            ['ngaySinh', 'date', 'format' => 'php:Y-m-d'],
            [['gioiTinh'], 'boolean'],
            [['tenBN'], 'string', 'max' => 50],
            [['anh'], 'file','extensions' => 'png,jpg,jpeg'],
            [['ngheNghiep', 'danToc', 'diaChi', 'anh'], 'string', 'max' => 255]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'tenBN' => 'Tên bệnh nhân',
            'ngaySinh' => 'Ngày sinh',
            'gioiTinh' => 'Giới tính',
            'ngheNghiep' => 'Nghề Nghiệp',
            'danToc' => 'Dân tộc',
            'diaChi' => 'Địa chỉ',
            'anh' => 'Ảnh',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getHosos()
    {
        return $this->hasMany(Hoso::className(), ['maBN' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getNoitrus()
    {
        return $this->hasMany(Noitru::className(), ['maBN' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getNoitrus0()
    {
        return $this->hasMany(Noitru::className(), ['maBN' => 'id']);
    }
}
