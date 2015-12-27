<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\PhongkhamSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Phòng khám';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="phongkham-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Tạo phòng khám', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [

            'id',

            'maKhoa',
            'tenPK',
            [
                'label' => 'Thuộc khoa',
                'format' => 'raw',
                'value' => function ($data) {
                    $url = \app\models\Khoa::findOne(['id' => $data->maKhoa]);
                    return $url->tenKhoa;
                }
            ],
            'moTa:ntext',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
