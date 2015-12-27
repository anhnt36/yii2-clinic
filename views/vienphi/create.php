<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Vienphi */

$this->title = 'Tạo viện phí';
$this->params['breadcrumbs'][] = ['label' => 'Viện phí', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<a href='javascript:history.go(-1)' class="btn btn-warning">Quay lại trang trước</a>
<div class="vienphi-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
