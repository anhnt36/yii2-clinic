<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Bnpk */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="bnpk-form">

    <?php $form = ActiveForm::begin(); ?>

    <?php
    $all = \app\models\Phongkham::find()->all();
    $array = array();
    $arrayBA = array();
    if(!empty($_GET['benhan'])) {
        $benhan = \app\models\Benhan::findOne(['id' => $_GET['benhan']]);
        $arrayBA = explode(' ',$benhan->deXuatKham);
    }
//    var_dump($arrayBA);

    foreach($all as $phongkham) {
        if(in_array($phongkham->maKhoa,$arrayBA)) {
            $array["{$phongkham->id}"] = $phongkham->tenPK;
        }
    }
    echo $form->field($model, 'maPK')->dropDownList($array);
    ?>

    <?= $form->field($model, 'ketQua')->textarea(['rows' => 6]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
