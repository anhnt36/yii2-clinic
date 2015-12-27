<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\NhanvienSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Nhân viên';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="nhanvien-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Tạo nhân viên', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [

            'id',
            'tenNV',
            'maKhoa',
            'chucVu',
            [
                'label' => 'Giới tính',
                'format' => 'raw',
                'value' => function ($data) {
                    if($data->gioiTinh == 1) {
                        return 'Nam';
                    } else {
                        return 'Nữ';
                    }
                }
            ],
            'queQuan',
            // 'danToc',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
