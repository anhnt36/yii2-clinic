<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\DonthuocntSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="donthuocnt-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'maNT') ?>

    <?= $form->field($model, 'donthuoc') ?>

    <?= $form->field($model, 'cachSD') ?>

    <?= $form->field($model, 'ngayKeDon') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
