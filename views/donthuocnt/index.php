<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\DonthuocntSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Donthuocnts';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="donthuocnt-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Tạo đơn thuốc', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'maNT',
            'donthuoc:ntext',
            'cachSD:ntext',
            'ngayKeDon',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
