<?php

namespace app\models\base;

use Yii;

/**
 * This is the model class for table "nhanvien".
 *
 * @property integer $id
 * @property integer $maKhoa
 * @property string $chucVu
 * @property boolean $gioiTinh
 * @property string $queQuan
 * @property string $danToc
 *
 * @property Khoa $maKhoa0
 */
class Nhanvien extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'nhanvien';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['maKhoa', 'chucVu', 'tenNV'], 'required'],
            [['maKhoa'], 'integer'],
            [['gioiTinh'], 'boolean'],
            [['chucVu', 'queQuan', 'danToc'], 'string', 'max' => 255]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'tenNV' => 'Tên nhân viên',
            'maKhoa' => 'Mã khoa',
            'chucVu' => 'Chức vụ',
            'gioiTinh' => 'Giới Tính',
            'queQuan' => 'Quê quán',
            'danToc' => 'Dân tộc',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMaKhoa0()
    {
        return $this->hasOne(Khoa::className(), ['id' => 'maKhoa']);
    }
}
