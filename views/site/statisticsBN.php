<?php

/* @var $this yii\web\View */
$this->title = 'Thống kê số bệnh nhân';

?>
<a href='javascript:history.go(-1)' class="btn btn-warning">Quay lại trang trước</a>

<script type="text/javascript" src="https://www.google.com/jsapi"></script>

<script type="text/javascript">
    google.load("visualization", "1", {packages:["corechart"]});
    google.setOnLoadCallback(drawChart);
    function drawChart() {
        var data = google.visualization.arrayToDataTable([
            ["", "Số lượng bệnh nhân ", { role: "style" } ],
            ["Tháng <?= $thang['0'] ?>", <?= $value['0'] ?> , "#b87333"],
            ["Tháng <?= $thang['1'] ?>", <?= $value['1'] ?>, "silver"],
            ["Tháng <?= $thang['2'] ?>", <?= $value['2'] ?>, "gold"],
            ["Tháng <?= $thang['3'] ?>", <?= $value['3'] ?>, "red"],
        ]);

        var view = new google.visualization.DataView(data);
        view.setColumns([0, 1,
            { calc: "stringify",
                sourceColumn: 1,
                type: "string",
                role: "annotation" },
            2]);

        var options = {
            title: "Biểu đồ cột",
            width: 600,
            height: 400,
            bar: {groupWidth: "95%"},
            legend: { position: "none" }
        };
        var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
        chart.draw(view, options);
    }

</script>
<center><h1>Biểu đồ thống kê bệnh nhân 4 tháng gần kề</h1></center>
<div class="row">
<div class="col-md-6"><div id="columnchart_values" style="width: 150px"></div></div>
    <script>
        google.setOnLoadCallback(drawChart);

        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ['Tháng', 'Số lượng bệnh nhân '],
                ['Tháng <?= $thang['0'] ?>',  <?= $value['0'] ?>],
                ['Tháng <?= $thang['1'] ?>',  <?= $value['1'] ?>],
                ['Tháng <?= $thang['2'] ?>',  <?= $value['2'] ?>],
                ['Tháng <?= $thang['3'] ?>',  <?= $value['3'] ?>]
            ]);

            var options = {
                title: 'Biểu đồ đường',
                curveType: 'function',
                legend: { position: 'bottom' }
            };

            var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

            chart.draw(data, options);
        }
    </script>
<div class="col-md-6"><div id="curve_chart" style="width: 500px; height: 400px"></div></div>
</div>











