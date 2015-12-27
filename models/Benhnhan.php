<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "benhnhan".
 *
 * @property integer $id
 * @property string $tenBN
 * @property string $ngaySinh
 * @property boolean $gioiTinh
 * @property string $ngheNghiep
 * @property string $danToc
 * @property string $diaChi
 * @property string $anh
 *
 * @property Hoso[] $hosos
 * @property Noitru[] $noitrus
 * @property Noitru[] $noitrus0
 */
class Benhnhan extends \app\models\base\Benhnhan
{
    public function events() {
        return [
            ActiveRecord::EVENT_BEFORE_DELETE => 'beforeDelete'
        ];
    }

    public function upload() {
        $this->anh->saveAs('uploads/benhnhan/' . $this->anh->baseName . '.' . $this->anh->extension);
        $this->anh = 'uploads/benhnhan/' . $this->anh->baseName . '.' . $this->anh->extension;
        $this->anh = 'uploads/benhnhan/' . $this->anh->baseName . '.' . $this->anh->extension;
        return true;
    }


    public function beforeDelete() {
        if(file_exists($this->anh)) {
            unlink($this->anh);
        }
        return true;
    }
}
