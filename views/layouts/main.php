<?php

/* @var $this \yii\web\View */
/* @var $content string */

use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use app\assets\AppAsset;

AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <?php $this->head() ?>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?= Html::csrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>

<!--    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

</head>
<body>
<?php $this->beginBody() ?>

<div class="row">
    <div class="col-md-2">
        <img src="<?= Yii::$app->request->baseUrl ?>/image/index.png" alt="" width="200px" height="153px"/>
    </div>
    <div class="col-md-10">
        <img src="<?= Yii::$app->request->baseUrl ?>/image/banner.jpg" alt="" " width="1024px" height="153px"/>
    </div>

</div>

<nav class="navbar navbar-inverse">

    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->

<!--        <div class="navbar-header">-->
<!--            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"-->
<!--                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">-->
<!--                <span class="sr-only">Toggle navigation</span>-->
<!--                <span class="icon-bar"></span>-->
<!--                <span class="icon-bar"></span>-->
<!--                <span class="icon-bar"></span>-->
<!--            </button>-->
<!--            <a class="navbar-brand" href="--><?php //echo Yii::$app->request->getBaseUrl(); ?><!--/site/introduction"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Quản lý bệnh viện Hợp l</a>-->
<!--        </div>-->

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li> <a href="<?php echo Yii::$app->request->getBaseUrl(); ?>/benhnhan"><span class="glyphicon glyphicon-home" ></span> Trang chủ<span class="sr-only">(current)</span></a></li>
                <li> <a href="<?php echo Yii::$app->request->getBaseUrl(); ?>/site/introduction"><span class="glyphicon glyphicon-book" aria-hidden="true"></span> Giới thiệu<span class="sr-only">(current)</span></a></li>

<!--                <li class="dropdown">-->
<!--                    <a href="--><?php //echo Yii::$app->request->getBaseUrl(); ?><!--/site/statistics?bieudo=benhnhan"><span class="glyphicon glyphicon-stats" aria-hidden="true"></span> Thống kê<span class="sr-only">(current)</span></a>-->
<!--                    <ul class="dropdown-menu">-->
<!--                        <li><a href="--><?php //echo Yii::$app->request->getBaseUrl(); ?><!--/user">User</a></li>-->
<!--                        <li role="separator" class="divider"></li>-->
<!--                        <li><a href="--><?php //echo Yii::$app->request->getBaseUrl(); ?><!--/rbac/route">Route</a></li>-->
<!--                        <li><a href="--><?php //echo Yii::$app->request->getBaseUrl(); ?><!--/rbac/assignment">Assignment</a></li>-->
<!--                        <li><a href="--><?php //echo Yii::$app->request->getBaseUrl(); ?><!--/rbac/role">Role</a></li>-->
<!--                    </ul>-->
<!--                </li>-->
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false"><span class="glyphicon glyphicon-stats" aria-hidden="true"></span> Thống kê <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="<?php echo Yii::$app->request->getBaseUrl(); ?>/site/statistics?bieudo=tonghop">Thống kê tổng quát</a></li>
                        <li><a href="<?php echo Yii::$app->request->getBaseUrl(); ?>/site/statistics?bieudo=benhnhan">Thông kê bệnh nhân</a></li>
                        <li><a href="<?php echo Yii::$app->request->getBaseUrl(); ?>/site/statistics?bieudo=luotkham">Thông kê lượt khám</a></li>
                    </ul>
                </li>
            </ul>

            <ul class="nav navbar-nav navbar-right">

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">Quản trị hệ thống <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="<?php echo Yii::$app->request->getBaseUrl(); ?>/user">User</a></li>
                        <li><a href="<?php echo Yii::$app->request->getBaseUrl(); ?>/backuprestore">Sao lưu và phục hồi dữ liệu</a></li>
                        <li role="separator" class="divider"></li>

                        <li><a href="<?php echo Yii::$app->request->getBaseUrl(); ?>/rbac/route">Route</a></li>
                        <li><a href="<?php echo Yii::$app->request->getBaseUrl(); ?>/rbac/assignment">Assignment</a></li>
                        <li><a href="<?php echo Yii::$app->request->getBaseUrl(); ?>/rbac/role">Role</a></li>
                    </ul>
                </li>
                <li><a href="<?= Yii::$app->request->baseUrl ?>/site/logout"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> Đăng xuất</a></li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->

</nav>

<div class="row">
    <div class="col-md-2">
        <ul class="nav nav-pills nav-stacked">
            <li class="active" role="presentation"><a href="<?php echo Yii::$app->request->getBaseUrl(); ?>/benhnhan"><span class="glyphicon glyphicon-list" aria-hidden="true"></span>&nbsp&nbsp <b>DANH MỤC</b></a></li>
            <li class="active" role="presentation"><a href="<?php echo Yii::$app->request->getBaseUrl(); ?>/benhnhan">OpenEMR</a></li>
            <li class="active" role="presentation"><a href="<?php echo Yii::$app->request->getBaseUrl(); ?>/benhnhan">X2CRM</a></li>
            <li class="active" role="presentation"><a href="<?php echo Yii::$app->request->getBaseUrl(); ?>/benhnhan">Bệnh nhân</a></li>
            <li class="active" role="presentation"><a href="<?php echo Yii::$app->request->getBaseUrl(); ?>/hoso">Hồ sơ</a></li>
            <li class="active" role="presentation"><a href="<?php echo Yii::$app->request->getBaseUrl(); ?>/noitru">Quản lý nội trú</a></li>
            <li class="active" role="presentation"><a href="<?php echo Yii::$app->request->getBaseUrl(); ?>/nhanvien">Nhân viên</a></li>
            <li class="active" role="presentation"><a href="<?php echo Yii::$app->request->getBaseUrl(); ?>/phongkham">Phòng khám</a></li>
            <li class="active" role="presentation"><a href="<?php echo Yii::$app->request->getBaseUrl(); ?>/khoa">Khoa</a></li>
            <li class="active" role="presentation"><a href="<?php echo Yii::$app->request->getBaseUrl(); ?>/duoc">Dược</a></li>
        </ul>
    </div>
    <div class="col-md-10">
<!--        <div class="container">-->
<?= $content ?>
<!--        </div>-->
    </div>
</div>


<footer class="footer">
    <div class="container">
        <p class="pull-left text-primary">Bệnh viện đa khoa Hợp Lực <?= date('Y') ?></p>

        <p class="pull-right text-primary">Địa chỉ: 595 Nguyễn Chí Thanh - P. Đông Thọ - Tp. Thanh Hoá</p>
    </div>
</footer>

<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>

