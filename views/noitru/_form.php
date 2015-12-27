<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\jui\DatePicker;

/* @var $this yii\web\View */
/* @var $model app\models\Noitru */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="noitru-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'soPhong')->textInput() ?>

    <?= $form->field($model, 'soGiuong')->textInput() ?>
    <?= $form->field($model, 'ngayXuatVien')->widget(\yii\jui\DatePicker::classname(), [
        'language' => 'en',
        'dateFormat' => 'yyyy-MM-dd',
    ]) ?>

    VD: ngay 10 tháng 9 năm 1994 : 1994-10-09

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
