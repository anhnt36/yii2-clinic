<?php

namespace app\controllers;

use app\models\base\Benhnhan;
use app\models\Benhan;
use app\models\Bnpk;
use app\models\Khoa;
use app\models\Nhanvien;
use app\models\Noitru;
use app\models\Phongkham;
use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\filters\VerbFilter;
use app\models\LoginForm;
use app\models\ContactForm;

class SiteController extends Controller
{
//    public function behaviors()
//    {
//        return [
//            'access' => [
//                'class' => AccessControl::className(),
//                'only' => ['logout'],
//                'rules' => [
//                    [
//                        'actions' => ['logout'],
//                        'allow' => true,
//                        'roles' => ['@'],
//                    ],
//                ],
//            ],
//
//        ];
//    }

    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    public function actionIndex()
    {
        $this->redirect(Yii::$app->request->baseUrl.'/site/login');
    }

    public function actionLogin()
    {
        $this->layout = 'main_old';
        if (!\Yii::$app->user->isGuest) {
            return $this->redirect('../benhnhan');
        }

        $model = new LoginForm();
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            return $this->redirect('../benhnhan');

        }
        return $this->render('login', [
            'model' => $model,
        ]);
    }

    public function actionLogout()
    {
        Yii::$app->user->logout();

        return $this->redirect('../site/login');
    }

    private function actionThang() {
        $now =getdate();
        $m = $now['mon'];
        if($m == 1) {
            return [10,11,12,1];
        } else {
            if($m == 2) {
                return [11,12,1,2];
            } else {
                if($m == 3) {
                    return [12,1,2,3];
                } else {
                    return [$m-3,$m-2,$m-1,$m];
                }
            }
        }
    }

    public function actionStatistics($bieudo)
    {
        if($bieudo == 'tonghop') {
            $tonghop = array();
            $tonghop['Số lượng hồ sơ bệnh nhân lưu trong hệ thống'] = count(Benhnhan::find()->all());
            $tonghop['Số lượng bệnh nhân nội trú'] = count(Noitru::find()->all());
            $tonghop['Số lượng nhân viên'] = count(Nhanvien::find()->all());
            $tonghop['Số lượng phòng khám'] = count(Phongkham::find()->all());
            $tonghop['Số lượng khoa'] = count(Khoa::find()->all());

            return $this->render('statistics',[
                'tonghop' => $tonghop
            ]);
        }
        if($bieudo == 'benhnhan') {
            $count = array();
            $count['0'] = 0;
            $count['1'] = 0;
            $count['2'] = 0;
            $count['3'] = 0;

            $array = $this->actionThang();
            $benhan = Benhan::find()->all();
            foreach($benhan as $ba) {
                if(date('m', $ba->created_at) == $array['0']) $count['0'] = $count[0]+1;
                if(date('m', $ba->created_at) == $array['1']) $count['1']++;
                if(date('m', $ba->created_at) == $array['2']) $count['2']++;
                if(date('m', $ba->created_at) == $array['3']) $count['3']++;
            }

            return $this->render('statisticsBN',[
                'thang' => $array,
                'value' => $count
            ]);
        }
        $khoa = Khoa::find()->all();
        $dskhoa = array();
        $dsmakhoa = array();
        $count = array();
        $j=0;

        foreach($khoa as $k) {
            $dskhoa["{$j}"] = $k->tenKhoa;
            $dsmakhoa["{$j}"] = $k->id;
            $count["{$j}"] = 0;
            $j++;
        }

        $thang = 0;
        $now = getdate();
        if($now['mon'] == 1) $thang=12;
        else $thang = $now['mon'];

        $benhan = Benhan::find()->all();


        foreach(Bnpk::find()->all() as $lk) {
            if(date('m', $lk->ngayKham == $thang)) {
                for($i=0; $i<count($khoa); $i++) {
                    if(Phongkham::findOne(['id' => $lk->maPK])->maKhoa == $dsmakhoa["$i"]) {
                        $count["$i"]++;
                    }
                }
            }
        }

        return $this->render('statisticsLK',[
            'thang' => $thang,
            'dskhoa' => $dskhoa,
            'value' => $count,
            'count' => $j
        ]);
    }

    public function actionIntroduction() {
        return $this->render('introduction');
    }

    public function actionContact()
    {
        $model = new ContactForm();
        if ($model->load(Yii::$app->request->post()) && $model->contact(Yii::$app->params['adminEmail'])) {
            Yii::$app->session->setFlash('contactFormSubmitted');

            return $this->refresh();
        }
        return $this->render('contact', [
            'model' => $model,
        ]);
    }

    public function actionAbout()
    {
        return $this->render('about');
    }
    public function actionOpenerm() {
        return $this->render('openerm');
    }

}
