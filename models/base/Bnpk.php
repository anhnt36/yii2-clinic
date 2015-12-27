<?php

namespace app\models\base;

use Yii;
use yii\db\ActiveRecord;
use yii\db\Expression;

/**
 * This is the model class for table "benhnhan_phongkham".
 *
 * @property integer $id
 * @property integer $maBA
 * @property integer $maPK
 * @property string $ketQua
 * @property string $ngayKham
 *
 * @property Benhan $maBA0
 * @property Phongkham $maPK0
 */
class Bnpk extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'benhnhan_phongkham';
    }
    public function behaviors()
    {
        return [
            'timestamp' => [
                'class' => 'yii\behaviors\TimestampBehavior',
                'attributes' => [
                    ActiveRecord::EVENT_BEFORE_INSERT => ['ngayKham'],
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
            [['maBA', 'maPK', 'ketQua'], 'required'],
            [['maBA', 'maPK'], 'integer'],
            [['ketQua'], 'string'],
            [['ngayKham'], 'safe']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'maBA' => 'Mã bệnh án',
            'maPK' => 'Mã phòng khám',
            'ketQua' => 'Kết quả',
            'ngayKham' => 'Ngày khám',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMaBA0()
    {
        return $this->hasOne(Benhan::className(), ['id' => 'maBA']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMaPK0()
    {
        return $this->hasOne(Phongkham::className(), ['id' => 'maPK']);
    }
}
