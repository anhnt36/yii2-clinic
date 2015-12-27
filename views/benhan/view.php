<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Benhan */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Benhans', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<a href='javascript:history.go(-1)' class="btn btn-warning">Quay lại trang trước</a>
<a href="<?= Yii::$app->request->baseUrl ?>/benhan?hoso=<?= \app\models\Benhan::findOne(['id' => $_GET['id']])->maHS ?>"  class="btn btn-success">Danh sách bệnh án</a>
<div class="benhnhan-view">

<div class="benhan-view">

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
    <h4><i><u>Bệnh án</u></i></h4><hr />
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'maHS',
            'deXuatKham:ntext',
            'ketLuanBA:ntext',
            'lichHen',
            'created_at:datetime',
            'updated_at:datetime',
        ],
    ]) ?>
    <h4><i><u>Đơn thuốc</u></i></h4><hr />
    <?
    if(!empty($model2))
    echo DetailView::widget([
        'model' => $model2,
        'attributes' => [
            'donthuoc:ntext',
            'cachSD:ntext',
            'ngayKeDon:datetime',
        ],
    ]);
    else echo '&nbsp&nbsp&nbsp&nbsp&nbsp Chưa có';
    ?>
    <h4><i><u>Viện phí</u></i></h4><hr />
    <?
    if(!empty($model1))
        echo DetailView::widget([
            'model' => $model1,
            'attributes' => [
                'id',
                'maBA',
                'tien',
                'mota:ntext',
                'ngayDongVP:datetime',
            ],
        ]);
    else echo '&nbsp&nbsp&nbsp&nbsp&nbsp Chưa có';
    ?>
</div>
