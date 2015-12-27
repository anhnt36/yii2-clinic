<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Benhnhan */

 $this->title = $model->tenBN;
$this->params['breadcrumbs'][] = ['label' => 'Bệnh nhân', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<a href='javascript:history.go(-1)' class="btn btn-warning">Quay lại trang trước</a>
<a href='<?= Yii::$app->request->baseUrl?>/benhnhan' class="btn btn-success">Danh sách bệnh nhân</a>
<div class="benhnhan-view">

    <h1>Bệnh nhân: <?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id], [
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
            'tenBN',
            'ngaySinh',
            [
                'attribute' => 'gioiTinh',
                'value' => $model->gioiTinh == 1 ? 'Nam' : 'Nữ'
            ],
            'ngheNghiep',
            'danToc',
            'diaChi',

        ],
    ]) ?>

</div>
