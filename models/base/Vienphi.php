<?php

namespace app\models\base;

use Yii;
use yii\db\ActiveRecord;
use yii\db\Expression;

/**
 * This is the model class for table "vienphi".
 *
 * @property integer $id
 * @property integer $maBA
 * @property integer $tien
 * @property string $mota
 * @property integer $ngayDongVP
 *
 * @property Benhan $maBA0
 */
class Vienphi extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'vienphi';
    }
    public function behaviors()
    {
        return [
            'timestamp' => [
                'class' => 'yii\behaviors\TimestampBehavior',
                'attributes' => [
                    ActiveRecord::EVENT_BEFORE_INSERT => ['ngayDongVP'],
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
            [['tien'], 'required'],
            [['maBA', 'tien', 'ngayDongVP'], 'integer'],
            [['mota'], 'string']
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
            'tien' => 'Tiền khám',
            'mota' => 'Mô tả',
            'ngayDongVP' => 'Ngày đóng viện phí',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMaBA0()
    {
        return $this->hasOne(Benhan::className(), ['id' => 'maBA']);
    }
}
