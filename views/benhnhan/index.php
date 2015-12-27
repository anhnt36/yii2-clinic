<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\BenhnhanSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Bệnh nhân';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="benhnhan-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Tạo bệnh nhân mới', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [

            'id',
            'tenBN',
            'ngaySinh',
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
            [
                'label' => 'Thêm vào nội trú',
                'format' => 'raw',
                'value' => function ($data) {
                    $BNnoitru = \app\models\Noitru::findOne(['maBN' => $data->id]);
                    if(empty($BNnoitru)) {
                        $url = yii::$app->request->baseUrl . '/noitru/create?maBN='.$data->id;
                        return Html::a('Thêm vào nội trú', $url, ['title' => 'Go']);
                    } else {
                        return '';
                    }
                }
            ],
            // 'danToc',
            // 'diaChi',
            // 'anh',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
