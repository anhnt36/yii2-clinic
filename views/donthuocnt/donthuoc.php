<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\VienphiSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Viện phí';
$this->params['breadcrumbs'][] = $this->title;
?>
<script>
    function printContent(el){
        var restorepage = document.body.innerHTML;
        var printcontent = document.getElementById(el).innerHTML;
        document.body.innerHTML = printcontent;
        window.print();
        document.body.innerHTML = restorepage;
    }
</script>
<a href='javascript:history.go(-1)' class="btn btn-warning">Quay lại trang trước</a>
<!--this.style.display ='none'; window.print()-->
<input type="button" class="btn btn-default" id="print_button"  value="In hóa đơn" onclick="printContent('donthuoc')" />
<div class="col-md-10 col-md-offset-1" id="donthuoc">
    <center><h3>ĐƠN THUỐC</h3></center>
    <br /><br />
    <?php
    $maNT = \app\models\Noitru::findOne(['id' => $_GET['noitru']]);
    $benhnhan = \app\models\Benhnhan::findOne(['id' => $maNT->maBN]);
    $donthuoc = \app\models\Donthuocnt::findOne(['maNT' => $maNT->id]);

    ?>
    <h4>
        <table>
            <tr>
                <td>Bệnh nhân :</td>
                <td><?= $benhnhan->tenBN  ?></td>
            </tr>
            <tr></tr>
            <tr>
                <td>Đơn thuốc :</td>
                <td><?= $donthuoc->donthuoc ?></td>
            </tr>
            <tr></tr>
            <tr>
                <td>Cách sử dụng :</td>
                <td><?= $donthuoc->cachSD ?></td>
            </tr>
        </table>
    </h4>

</div>
