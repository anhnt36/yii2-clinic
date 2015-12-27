<?php

namespace app\controllers;

use app\models\Benhan;
use app\models\HosoSearch;
use app\models\Noitru;
use Yii;
use app\models\Benhnhan;
use app\models\BenhnhanSearch;
use yii\db\Expression;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use app\models\Hoso;
use yii\filters\AccessControl;

/**
 * BenhnhanController implements the CRUD actions for Benhnhan model.
 */
class BenhnhanController extends Controller
{
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [

                ],
            ],
//            'access' => [
//                'class' => AccessControl::className(),
//                'rules' => [
//                    [
//                        'allow' => true,
//                        'actions' => ['create', 'delete','update',],
//                        'roles' => ['admin','Y tá'],
//                    ],
//                    [
//                        'allow' => true,
//                        'actions' => [],
//                        'roles' => ['@'],
//                    ],
//                ],
//            ],
        ];
    }

    /**
     * Lists all Benhnhan models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new BenhnhanSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

//    public function actionHoso()
//    {
//        $searchModel = new BenhnhanSearch();
//        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
//        $model = new Benhnhan();
//        var_dump($model->getHosos());
//        die();
//        return $this->render('index', [
//            'searchModel' => $searchModel,
//            'dataProvider' => $dataProvider,
//        ]);
//    }
//
//

    /**
     * Displays a single Benhnhan model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Benhnhan model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {

        $model = new Benhnhan();
        $connection = \Yii::$app->db;
        $transaction = $connection->beginTransaction();
        try {
            if ($model->load(Yii::$app->request->post()) && $model->save()) {

                $model_1 = new Hoso();
                $model_1->maBN = $model->id;
                $model_1->load(Yii::$app->request->post());
                $model_1->save();
                $transaction->commit();
                return $this->redirect(['view', 'id' => $model->id]);
            } else {
                return $this->render('create', [
                    'model' => $model,
                ]);
            }
        } catch (Exception $e) {
            $transaction->rollback();
            throw $e;
        }
    }

    /**
     * Updates an existing Benhnhan model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing Benhnhan model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $noitru = Noitru::findOne(['maBN' => $id]);
        if(!empty($noitru)) {
            Noitru::findOne(['maBN' => $id])->delete();
        }
        $maHS = Hoso::findOne(['maBN' => $id])->id;
        $benhan = Benhan::find()->all();

        foreach($benhan as $ba) {
            if($ba->maHS == $maHS) Benhan::findOne(['id' => $ba->id])->delete();
        }
        Hoso::findOne(['maBN'=> $id])->delete();
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Benhnhan model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Benhnhan the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Benhnhan::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
