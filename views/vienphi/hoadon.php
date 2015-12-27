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
<input type="button" class="btn btn-default" id="print_button"  value="In hóa đơn" onclick="printContent('hoadon')" />
<div class="col-md-10 col-md-offset-1" id="hoadon">
    <center>Cộng hòa xã hội chủ nghĩa Việt Nam</center>
    <center>Độc lập - Tự do - Hạnh phúc</center>
    <br /><br />
    <center><h4>Hóa đơn viện phí</h4></center>
    <br /><br />
    <?php
        $benhan = \app\models\Benhan::findOne(['id' => $_GET['benhan']]);
        $hoso = \app\models\Hoso::findOne(['id' => $benhan->maHS]);
        $benhnhan = \app\models\Benhnhan::findOne(['id' => $hoso->maBN]);
        $vienphi = \app\models\Vienphi::findOne(['maBA' => $benhan->id]);

    ?>
    <p>Bệnh nhân : <?= $benhnhan->tenBN ?></p>
    <p>Tiền viện phí : <?php echo number_format($vienphi->tien, 2, '.', ','); ?> VNĐ</p>
    <br /><br />
    <div class="col-md-3">
        <center><p></p></center>
        <center><p></p></center>
        <center><p>Chữ kí người nộp tiền</p></center>
        <center><p>(Kí và ghi rõ họ tên)</p></center>
    </div>
    <div class="col-md-6 col-md-offset-3">

        <?php $now = getdate(); ?>
        <center><p>Thanh Hóa ,Ngày <?= $now['mday'] ?> tháng <?= $now['mon'] ?> năm <?= $now['year'] ?></p></center>
        <center><p>Chữ kí người thu tiền</p></center>
        <center><p>(Kí và ghi rõ họ tên)</p></center>
    </div>

</div>
