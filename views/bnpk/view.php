<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Bnpk */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Bnpks', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<a href='javascript:history.go(-1)' class="btn btn-warning">Quay lại trang trước</a>
<a href="<?= Yii::$app->request->baseUrl ?>/bnpk?benhan=<?= \app\models\Bnpk::findOne(['id' => $_GET['id']])->maBA ?>"  class="btn btn-success">Danh sách các lượt khám</a>

<div class="bnpk-view">

    <h1><?= Html::encode($this->title) ?></h1>

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
            'maBA',
            'maPK',
            'ketQua:ntext',
            'ngayKham:datetime',
        ],
    ]) ?>

</div>
