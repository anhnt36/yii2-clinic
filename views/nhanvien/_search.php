<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\NhanvienSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="nhanvien-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'maKhoa') ?>

    <?= $form->field($model, 'chucVu') ?>

    <?= $form->field($model, 'gioiTinh')->checkbox() ?>

    <?= $form->field($model, 'queQuan') ?>

    <?php // echo $form->field($model, 'danToc') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
