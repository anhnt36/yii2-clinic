<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\NoitruSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="noitru-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'maBN') ?>

    <?= $form->field($model, 'soPhong') ?>

    <?= $form->field($model, 'soGiuong') ?>

    <?php // echo $form->field($model, 'ngayXuatVien') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
