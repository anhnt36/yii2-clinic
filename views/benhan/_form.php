<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Benhan */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="benhan-form">

    <?php $form = ActiveForm::begin(); ?>
    <?php
        $khoa = \app\models\Khoa::find()->all();
        $arrayKhoa = array();
        foreach($khoa as $k) {
            $arrayKhoa["$k->id"] = $k->tenKhoa;
        }
        $benhan = '';
        if(!empty($_GET['id'])) {
            $benhan = \app\models\base\Benhan::findOne(['id' => $_GET['id']]);
            $model->deXuatKham = explode(' ',$benhan->deXuatKham);
        }

    ?>
    <?php echo $form->field($model, 'deXuatKham',[
        'template' => "<div class='row'><div class='container'>{label}</div></div><div class='col-md-2'> {input}{error}</div>"
    ])->checkboxList($arrayKhoa,['inline'=>true]);?>
    <div class="row"></div>
    <?= $form->field($model, 'ketLuanBA')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'lichHen')->widget(\yii\jui\DatePicker::classname(), [
        'language' => 'en',
        'dateFormat' => 'yyyy-MM-dd',
    ]) ?>
    VD: ngay 10 tháng 9 năm 1994 : 1994-10-09

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
