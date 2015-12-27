<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\NoitruSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Nội trú';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="noitru-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>


    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [

            'id',
            'maBN',
            [
                'label' => 'Tên bệnh nhân',
                'format' => 'raw',
                'value' => function ($data) {
                    $url = \app\models\Benhnhan::findOne(['id' => $data->maBN]);
                    return $url->tenBN;
                }
            ],
            'soPhong',
            'soGiuong',
            [
                'label' => 'Kê đơn thuốc',
                'format' => 'raw',
                'value' => function ($data) {
                    $url = Yii::$app->request->baseUrl."/donthuocnt/create?noitru={$data->id}";
                    return Html::a('Kê đơn thuốc', $url, ['title' => 'Go']);
                }
            ],
            [
                'label' => 'In đơn thuốc',
                'format' => 'raw',
                'value' => function ($data) {
                    $model1 = \app\models\Donthuocnt::findOne(['maNT' => $data->id]);
                    if(!empty($model1)) {
                        $url = Yii::$app->request->baseUrl."/donthuocnt/indonthuoc?noitru={$data->id}";
                        return Html::a('In đơn thuốc', $url, ['title' => 'Go']);
                    } else {
                        return '';
                    }

                }
            ],
            // 'ngayXuatVien',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
