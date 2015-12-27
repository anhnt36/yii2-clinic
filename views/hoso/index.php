<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\HosoSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Hồ sơ';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="hoso-index">

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
            [
                'attribute' => 'created_at',
                'value' => function($dataProvider) {
                    return gmdate("Y-m-d\TH:i:s\Z", $dataProvider->created_at);
                }
            ],
            [
                'attribute' => 'updated_at',
                'value' => function($dataProvider) {
                    return gmdate("Y-m-d\TH:i:s\Z", $dataProvider->updated_at);
                }
            ],
            [
                'label'=>'Hồ sơ',
                'format'=>'raw',
                'value' => function($data){
                    $url = yii::$app->request->baseUrl . '/benhan?hoso='.$data->id ;
                        return Html::a('Hồ sơ', $url, ['title' => 'Go']);
                }
            ],
            [
                'class' => 'yii\grid\ActionColumn',
                'buttons' => [
                    'update' => function ($url, $model) {
                        return '';
                    }
                ]

            ],
        ],
    ]); ?>

</div>
