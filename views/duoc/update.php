<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Duoc */

$this->title = 'Cập nhật danh mục thuốc: ' . ' ' . $model->maDMThuoc;
$this->params['breadcrumbs'][] = ['label' => 'Duocs', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->maDMThuoc, 'url' => ['view', 'id' => $model->maDMThuoc]];
$this->params['breadcrumbs'][] = 'Update';
?>
<a href='javascript:history.go(-1)' class="btn btn-warning">Quay lại trang trước</a>
<div class="duoc-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
