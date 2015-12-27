<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Phongkham */

$this->title = 'Tạo phòng khám';
$this->params['breadcrumbs'][] = ['label' => 'Phòng khám', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<a href='javascript:history.go(-1)' class="btn btn-warning">Quay lại trang trước</a>
<div class="phongkham-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
