<?php

namespace app\models;

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
class Benhan extends \app\models\base\Benhan
{

}
