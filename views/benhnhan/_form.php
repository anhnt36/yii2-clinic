<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Benhnhan */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="benhnhan-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'tenBN')->textInput(['maxlength' => true]) ?>

<!--    --><?//= $form->field($model, 'ngaySinh')->widget(DateControl::classname(), [
//    'displayFormat' => 'd-M-Y H:i:s',
//    'type'=>DateControl::FORMAT_DATETIME
//    ]) ?>

    <?= $form->field($model, 'ngaySinh')->textInput() ?>
    VD: ngay 10 tháng 9 năm 1994 : 1994-10-09
    <?php $model->gioiTinh = 1; ?>
    <?= $form->field($model, 'gioiTinh')->radioList(array('1'=>'Nam',0=>'Nữ')

    ); ?>

    <?= $form->field($model, 'ngheNghiep')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'danToc')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'diaChi')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
