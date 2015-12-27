<?php

namespace app\models\base;

use Yii;
use yii\db\ActiveRecord;
use yii\db\Expression;

/**
 * This is the model class for table "benhan".
 *
 * @property integer $id
 * @property integer $maHS
 * @property string $deXuatKham
 * @property string $ketLuanBA
 * @property string $lichHen
 * @property integer $created_at
 * @property integer $updated_at
 *
 * @property Hoso $maHS0
 * @property BenhnhanPhongkham[] $benhnhanPhongkhams
 * @property Donthuoc[] $donthuocs
 * @property Vienphi[] $vienphis
 */
class Benhan extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'benhan';
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
            [['maHS', 'deXuatKham'], 'required'],
            [['maHS', 'created_at', 'updated_at'], 'integer'],
            [[ 'ketLuanBA'], 'string'],
            [['lichHen'], 'date', 'format' => 'php:Y-m-d']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'maHS' => 'Mã hồ sơ',
            'deXuatKham' => 'Đề xuất khám',
            'ketLuanBA' => 'Kết Luận Bệnh án',
            'lichHen' => 'Lịch Hẹn',
            'created_at' => 'Thời gian tạo',
            'updated_at' => 'Thời gian cập nhật',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMaHS0()
    {
        return $this->hasOne(Hoso::className(), ['id' => 'maHS']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBenhnhanPhongkhams()
    {
        return $this->hasMany(BenhnhanPhongkham::className(), ['maBA' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDonthuocs()
    {
        return $this->hasMany(Donthuoc::className(), ['maBA' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getVienphis()
    {
        return $this->hasMany(Vienphi::className(), ['maBA' => 'id']);
    }
}
