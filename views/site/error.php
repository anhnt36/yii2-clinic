<?php

/* @var $this yii\web\View */
/* @var $name string */
/* @var $message string */
/* @var $exception Exception */

use yii\helpers\Html;

$this->title = $name;
?>
<a href='javascript:history.go(-1)' class="btn btn-warning">Quay lại trang trước</a>
<div class="site-error">
    <br />

    <div class="col-md-6 col-md-offset-3">
    <div class="alert alert-danger">
        <center><?= nl2br(Html::encode($message)) ?></center>
    </div>
    <center><img src="<?= Yii::$app->request->baseUrl?>/image/permission.jpg" alt=""/></center>
    </div>

</div>
