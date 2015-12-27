<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\DuocSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Danh mục thuốc';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="duoc-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Tạo danh mục thuốc', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            'maDMThuoc',
            'tenDMThuoc',

            [
                'class' => 'yii\grid\ActionColumn',

            ]
        ]]);
    ?>

</div>
