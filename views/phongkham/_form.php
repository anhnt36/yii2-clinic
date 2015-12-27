<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Phongkham */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="phongkham-form">

    <?php $form = ActiveForm::begin(); ?>


    <?php
        $all = \app\models\Khoa::find()->all();
        $array = array();
        foreach($all as $khoa) {
            $array["{$khoa->id}"] = $khoa->tenKhoa;
        }
        echo $form->field($model, 'maKhoa')->dropDownList($array);
    ?>
    <?= $form->field($model, 'tenPK')->textInput() ?>

    <?= $form->field($model, 'moTa')->textarea(['rows' => 6]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
