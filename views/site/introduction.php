<?php

/* @var $this yii\web\View */

$this->title = 'Giới thiệu';
?>

<!DOCTYPE html>
<html>
<head>
    <script src="http://maps.googleapis.com/maps/api/js"></script>
    <script>

        var myCenter=new google.maps.LatLng(19.695021, 105.748321);

        function initialize()
        {
            var mapProp = {
                center:myCenter,
                zoom:14,
                mapTypeId:google.maps.MapTypeId.ROADMAP
            };

            var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);

            var marker=new google.maps.Marker({
                position:myCenter,
            });

            marker.setMap(map);
        }

        google.maps.event.addDomListener(window, 'load', initialize);
    </script>
</head>

<body>
<div class="col-md-6">
    <p>Tổng công ty cổ phần Hợp Lực tiền thân là Hợp tác xã vận tải Hợp Lực được thành lập năm 1996. Trải qua hơn 12 năm xây dựng và phát triển Tổng công ty cổ phần Hợp Lực không ngừng phát triển về quy mô cũng như chất lượng hoạt động sản xuất kinh doanh và phục vụ khám chữa bệnh. Uy tín, thương hiệu của Tổng công ty đã được khẳng định trên thị trường trong và ngoài tỉnh. Đặc biệt trong 5 năm qua Doanh nghiệp Hợp Lực đã có bước phát triển vượt bậc trên tất cả các lĩnh vực. Năm 2005 khai trương Bệnh viện Đa khoa Hợp Lực năm 2007 thành lập Công ty dược vật tư y tế, năm 2008 thành lập công ty xây dựng Hợp Lực và đầu năm 2009 thành lập Trường trung cấp Y dược Hợp Lực.Vốn điều lệ 300 tỷ đồng, giá trị doanh nghiệp 500 tỷ đồng.

        Hiện nay Tổng công ty có 5 đơn vị thành viên. Hợp tác xã vận tải Hợp Lực bộ máy tổ chức gồm 1 chủ nhiệm 3 phó chủ nhiệm, ban kiểm soát với 5 thành viên và 180 xã viên Hợp tác xã với chức năng kinh doanh vận tải hàng hoá và hành khách trên phạm vi toàn quốc.</p>
</div>
<div class="col-md-6">
    <div id="googleMap" style="width:497px;height:300px;"></div>
</div>

</body>

</html>


