<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Khoa */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="khoa-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'tenKhoa')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'moTa')->textarea(['rows' => 6]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
