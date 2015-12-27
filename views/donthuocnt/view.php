<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Donthuocnt */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Donthuocnts', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<a href='javascript:history.go(-1)' class="btn btn-warning">Quay lại trang trước</a>

<div class="donthuocnt-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Cập nhật', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Xóa', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'maNT',
            'donthuoc:ntext',
            'cachSD:ntext',
            'ngayKeDon:datetime',
        ],
    ]) ?>

</div>
