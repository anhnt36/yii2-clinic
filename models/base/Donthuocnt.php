<?php

namespace app\models\base;

use Yii;
use yii\filters\AccessControl;
use yii\db\Expression;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "donthuocnt".
 *
 * @property integer $id
 * @property integer $maNT
 * @property string $donthuoc
 * @property string $cachSD
 * @property integer $ngayKeDon
 */
class Donthuocnt extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'donthuocnt';
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
            [['maNT', 'ngayKeDon'], 'integer'],
            [['donthuoc', 'cachSD'], 'string']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'maNT' => 'Ma Nt',
            'donthuoc' => 'Donthuoc',
            'cachSD' => 'Cach Sd',
            'ngayKeDon' => 'Ngay Ke Don',
        ];
    }
}
