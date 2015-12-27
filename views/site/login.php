<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model app\models\LoginForm */

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;

$this->title = 'Login';
$this->params['breadcrumbs'][] = $this->title;
?>
<html>
<head>
    <style type="text/css">
        .example{
            margin: 50px;

        }
        body {
            background: #acdd4a;
        }

    </style>

</head>
<body>
<div class="example">
<div class="col-md-4 col-md-offset-4">
    <center><h1><p class="text-danger">ĐĂNG NHẬP</p></h1></center><hr /><hr />
<div class="tab-pane active in" id="login">
    <?php $form = ActiveForm::begin([
        'id' => 'login-form',
        'options' => ['class' => 'form-horizontal'],
        'fieldConfig' => [
            'template' => "{label} : {input}\n<div class=\"col-lg-10\">{error}</div>",
            'labelOptions' => ['class' => 'control-label'],
        ],
    ]); ?>
    <?= $form->field($model, 'username') ?>
    <?= $form->field($model, 'password')->passwordInput() ?>
    <?= $form->field($model, 'rememberMe')->checkbox([
        'template' => "<div class=\"col-lg-6\">{input} {label}</div>\n<div class=\"col-lg-8\">{error}</div>",
    ]) ?>

        <div class="control-group">
            <!-- Button -->
            <div class="controls">
                <?= Html::submitButton('Login', ['class' => 'btn btn-primary', 'name' => 'login-button']) ?>
            </div>
        </div>
</div>
</div>
</div>
<script class="cssdeck" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script class="cssdeck" src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.1/js/bootstrap.min.js"></script>


</html>
