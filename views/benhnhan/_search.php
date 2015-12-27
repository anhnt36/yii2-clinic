<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\BenhnhanSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="benhnhan-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'tenBN') ?>

    <?= $form->field($model, 'ngaySinh') ?>

    <?= $form->field($model, 'gioiTinh')->checkbox() ?>

    <?= $form->field($model, 'ngheNghiep') ?>

    <?php // echo $form->field($model, 'danToc') ?>

    <?php // echo $form->field($model, 'diaChi') ?>

    <?php // echo $form->field($model, 'anh') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
