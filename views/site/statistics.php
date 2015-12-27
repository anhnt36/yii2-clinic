<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\NoitruSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Thống kê tổng quát';
$this->params['breadcrumbs'][] = $this->title;
?>
<a href='javascript:history.go(-1)' class="btn btn-warning">Quay lại trang trước</a>

<center><h1>Thống kê tổng quát về bệnh viện</h1></center>
<div class="col-md-8 col-md-offset-2">

<table class="table table-condensed">
    <tbody>
        <?php
            foreach($tonghop as $key => $value) {
                echo "<tr class='info'>
                        <td>{$key}</td>
                        <td>$value</td>
                    </tr>";
            }
        ?>

    </tbody>
</table>
</div>