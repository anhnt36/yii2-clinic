<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Donthuocnt */

$this->title = 'Tạo đơn thuốc';
$this->params['breadcrumbs'][] = ['label' => 'Donthuocnts', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="donthuocnt-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
