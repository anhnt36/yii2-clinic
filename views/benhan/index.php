<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\BenhanSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Bệnh án';
$this->params['breadcrumbs'][] = $this->title;
?>
<a href='javascript:history.go(-1)' class="btn btn-warning">Quay lại trang trước</a>
<div class="benhan-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Tạo bệnh án', ['create?hoso=' . $_GET['hoso']], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'columns' => [
            'id',
            'maHS',
            [
                'label' => 'Đề xuất khám',
                'format' => 'raw',
                'value' => function ($data) {
                    $array = array();
                    $arrayBA = explode(' ',$data->deXuatKham);
                    $khoa = \app\models\Khoa::find()->all();
                    foreach($khoa as $k) {
                        if(in_array($k->id,$arrayBA)) {
                            $array[] = $k->tenKhoa;
                        }
                    }
                    return implode(',</br />',$array);
                }
            ],
            'ketLuanBA:ntext',
            'lichHen',
            [
                'label' => 'Viện phí',
                'format' => 'raw',
                'value' => function ($data) {
                    $url = "vienphi/create?benhan={$data->id}";
                    return Html::a('Viện phí', $url, ['title' => 'Go']);
                }
            ],
            [
                'label' => 'In hóa đơn',
                'format' => 'raw',
                'value' => function ($data) {
                    $model1 = \app\models\Vienphi::findOne(['maBA' => $data->id]);
                    if(!empty($model1)) {
                        $url = "vienphi/inhoadon?benhan={$data->id}";
                        return Html::a('In hóa đơn', $url, ['title' => 'Go']);
                    } else {
                        return '';
                    }
                }
            ],
            [
                'label' => 'Kê đơn thuốc',
                'format' => 'raw',
                'value' => function ($data) {
                    $url = "donthuoc/create?benhan={$data->id}";
                    return Html::a('Kê đơn thuốc', $url, ['title' => 'Go']);
                }
            ],
            [
                'label' => 'In đơn thuốc',
                'format' => 'raw',
                'value' => function ($data) {
                    $model1 = \app\models\Donthuoc::findOne(['maBA' => $data->id]);
                    if(!empty($model1)) {
                        $url = "donthuoc/indonthuoc?benhan={$data->id}";
                        return Html::a('In đơn thuốc', $url, ['title' => 'Go']);
                    } else {
                        return '';
                    }

                }
            ],
            [
                'label' => 'Khám bệnh',
                'format' => 'raw',
                'value' => function ($data) {
                    $url = "bnpk/index?benhan={$data->id}";
                    return Html::a('Khám bệnh', $url, ['title' => 'Go']);
                }
            ],
            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
