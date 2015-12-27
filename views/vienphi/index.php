<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\VienphiSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Viện phí';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="vienphi-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Tạo viện phí', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [

            'id',
            'maBA',
            'tien',
            'mota:ntext',
            'ngayDongVP',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
