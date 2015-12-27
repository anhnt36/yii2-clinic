<?php

namespace app\models\base;

use Yii;
use yii\db\ActiveRecord;
use yii\db\Expression;
/**
 * This is the model class for table "donthuoc".
 *
 * @property integer $id
 * @property string $donthuoc
 * @property string $cachSD
 * @property string $ngayKeDon
 *
 * @property Benhan[] $benhans
 * @property Noitru[] $noitrus
 */
class Donthuoc extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'donthuoc';
    }
    public function behaviors()
    {
        return [
            'timestamp' => [
                'class' => 'yii\behaviors\TimestampBehavior',
                'attributes' => [
                    ActiveRecord::EVENT_BEFORE_INSERT => ['ngayKeDon'],
                ],
                'value' => new Expression('UNIX_TIMESTAMP(NOW())'),
            ],
        ];
    }
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['donthuoc', 'cachSD'], 'required'],
            [['donthuoc', 'cachSD'], 'string'],
            [['maBA'], 'integer'],
            [['ngayKeDon'], 'safe']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'donthuoc' => 'Đơn thuốc',
            'maBA' => 'Mã nột trú',
            'cachSD' => 'Cách sử dụng',
            'ngayKeDon' => 'Ngày kê đơn',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBenhans()
    {
        return $this->hasMany(Benhan::className(), ['maDT' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getNoitrus()
    {
        return $this->hasMany(Noitru::className(), ['maDT' => 'id']);
    }
}
