<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Benhnhan */

$this->title = 'Cập nhật Bệnh nhân: ' . ' ' . $model->tenBN;
$this->params['breadcrumbs'][] = ['label' => 'Benhnhans', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<a href='javascript:history.go(-1)' class="btn btn-warning">Quay lại trang trước</a>
<div class="benhnhan-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
