<?php

/* @var $this yii\web\View */
$this->title = 'Thống kê lượt khám ở các khoa';

?>
<a href='javascript:history.go(-1)' class="btn btn-warning">Quay lại trang trước</a>

<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<?php
$mamau = ['yellow','green','red','blue','#ADFF2F','#FF00FF','#DA70D6','#87CEEB','#808080','#FF8C00'];
$chuoi = '';
for($i = 0; $i < $count; $i++){
    $chuoi.="['$dskhoa[$i]', $value[$i], '$mamau[$i]'],";
}

?>

<script type="text/javascript">
    google.load("visualization", "1", {packages:["corechart"]});
    google.setOnLoadCallback(drawChart);
    function drawChart() {
        var data = google.visualization.arrayToDataTable([
            ["", "Số lượt khám ", { role: "style" } ],
            <?= $chuoi ?>

        ]);

        var view = new google.visualization.DataView(data);
        view.setColumns([0, 1,
            { calc: "stringify",
                sourceColumn: 1,
                type: "string",
                role: "annotation" },
            2]);

        var options = {
            title: "",
            width: 800,
            height: 400,
            bar: {groupWidth: "95%"},
            legend: { position: "none" }
        };
        var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
        chart.draw(view, options);
    }
</script>
<center><h1>Biểu đồ thống kê số lượt khám ở các khoa trong tháng <?= $thang ?></h1></center>
<div id="columnchart_values" style="width: 900px; height: 400px; padding-left: 100px"></div>







