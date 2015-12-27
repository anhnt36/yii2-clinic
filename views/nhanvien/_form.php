<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Nhanvien */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="nhanvien-form">

    <?php $form = ActiveForm::begin(); ?>

    <?php
    $all = \app\models\Khoa::find()->all();
    $array = array();
    foreach($all as $khoa) {
        $array["{$khoa->id}"] = $khoa->tenKhoa;
    }
    echo $form->field($model, 'maKhoa')->dropDownList($array);
    ?>

    <?= $form->field($model, 'tenNV')->textInput(['maxlength' => true]) ?>

    <?php
        $array = array(
            'Bác sĩ' => 'Bác sĩ',
            'Y tá' => 'Y tá',
            'Nhân viên khác' => 'Nhân viên khác'
        );
        echo $form->field($model, 'chucVu')->dropDownList($array);
    ?>

    <?php $model->gioiTinh = 1; ?>
    <?= $form->field($model, 'gioiTinh')->radioList(array('1'=>'Nam',0=>'Nữ')) ?>


    <?= $form->field($model, 'queQuan')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'danToc')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
