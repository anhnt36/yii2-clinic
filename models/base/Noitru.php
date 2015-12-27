<?php

namespace app\models\base;

use Yii;

/**
 * This is the model class for table "noitru".
 *
 * @property integer $id
 * @property integer $maBN
 * @property integer $maDT
 * @property integer $soPhong
 * @property integer $soGiuong
 * @property integer $ngayXuatVien
 *
 * @property Benhnhan $maBN0
 * @property Donthuoc $maDT0
 * @property Benhnhan $maBN1
 */
class Noitru extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'noitru';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['maBN', 'soPhong', 'soGiuong'], 'required'],
            [['maBN', 'soPhong', 'soGiuong'], 'integer'],
            [['ngayXuatVien'], 'safe'],
            [['ngayXuatVien'], 'date', 'format' => 'php:Y-m-d']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'maBN' => 'Mã bệnh nhân',
            'soPhong' => 'Số phòng',
            'soGiuong' => 'Số giường',
            'ngayXuatVien' => 'Ngày xuất viện',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMaBN0()
    {
        return $this->hasOne(Benhnhan::className(), ['id' => 'maBN']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMaBN1()
    {
        return $this->hasOne(Benhnhan::className(), ['id' => 'maBN']);
    }
}
