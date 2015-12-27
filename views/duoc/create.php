<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Duoc */

$this->title = 'Tạo danh mục thuốc';
$this->params['breadcrumbs'][] = ['label' => 'Dược', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<a href='javascript:history.go(-1)' class="btn btn-warning">Quay lại trang trước</a>
<div class="duoc-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
