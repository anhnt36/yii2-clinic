<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\BnpkSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Khám';
$this->params['breadcrumbs'][] = $this->title;
?>
<a href='javascript:history.go(-1)' class="btn btn-warning">Quay lại trang trước</a>
<a href="<?= Yii::$app->request->baseUrl ?>/benhan?hoso=<?= \app\models\Benhan::findOne(['id' => $_GET['benhan']])->maHS ?>"  class="btn btn-success">Danh sách các bệnh án</a>

<div class="bnpk-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Tạo lượt khám', ["create?benhan={$_GET['benhan']}"], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [

            'id',
            'maBA',
            'maPK',
            'ketQua:ntext',
            [
                'label' => 'Ngày Khám',
                'value' => function($dataProvider) {
                    return gmdate("Y-m-d\TH:i:s\Z", $dataProvider->ngayKham);
                }
            ],

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
