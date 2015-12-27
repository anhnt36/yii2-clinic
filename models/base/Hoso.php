<?php

namespace app\models\base;

use Yii;
use yii\db\ActiveRecord;
use yii\db\Expression;

/**
 * This is the model class for table "hoso".
 *
 * @property integer $id
 * @property integer $maBN
 * @property integer $created_at
 * @property integer $updated_at
 *
 * @property Benhan[] $benhans
 * @property Benhnhan $maBN0
 */
class Hoso extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'hoso';
    }

    public function behaviors()
    {
        return [
            'timestamp' => [
                'class' => 'yii\behaviors\TimestampBehavior',
                'attributes' => [
                    ActiveRecord::EVENT_BEFORE_INSERT => ['created_at', 'updated_at'],
                    ActiveRecord::EVENT_BEFORE_UPDATE => ['updated_at'],
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
            [['maBN'], 'required'],
            [['maBN'], 'integer']
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
            'created_at' => 'Thời gian tạo',
            'updated_at' => 'Thời gian cập nhật',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBenhans()
    {
        return $this->hasMany(Benhan::className(), ['maHS' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMaBN0()
    {
        return $this->hasOne(Benhnhan::className(), ['id' => 'maBN']);
    }
}
