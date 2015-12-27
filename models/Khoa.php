<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "khoa".
 *
 * @property integer $id
 * @property string $tenKhoa
 * @property string $moTa
 *
 * @property Nhanvien[] $nhanviens
 * @property Phongkham[] $phongkhams
 */
class Khoa extends \app\models\base\Khoa
{

}
