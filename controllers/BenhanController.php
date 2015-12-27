<?php

namespace app\controllers;

use app\models\Donthuoc;
use app\models\Vienphi;
use Yii;
use app\models\Benhan;
use app\models\BenhanSearch;
use yii\db\Exception;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;

/**
 * BenhanController implements the CRUD actions for Benhan model.
 */
class BenhanController extends Controller
{
//    public function behaviors()
//    {
//        return [
//            'verbs' => [
//                'class' => VerbFilter::className(),
//                'actions' => [
//
//                ],
//            ],
//            'access' => [
//                'class' => AccessControl::className(),
//                'rules' => [
//                    [
//                        'allow' => true,
//                        'actions' => ['create', 'delete', 'update'],
//                        'roles' => ['admin', 'Bác sĩ'],
//                    ],
//                    [
//                        'allow' => true,
//                        'actions' => ['index', 'view'],
//                        'roles' => ['@'],
//                    ],
//                ],
//            ],
//        ];
//    }

    /**
     * Lists all Benhan models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new BenhanSearch();

        $hoso = array(
            "BenhanSearch" => [
                'maHS' => $_GET['hoso']
            ]
        );
//        Yii::$app->request->queryParams
        $dataProvider = $searchModel->search($hoso);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Benhan model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        $model = $this->findModel($id);
        $model1 = Vienphi::find()->where(['maBA' => $id])->one();
        $model2 = Donthuoc::find()->where(['maBA' => $id])->one();
        return $this->render('view', [
            'model' => $model,
            'model1' => $model1,
            'model2' => $model2,
        ]);
    }

    /**
     * Creates a new Benhan model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {

        $model = new Benhan();
        $model->maHS = $_GET['hoso'];

        $connection = \Yii::$app->db;
        $transaction = $connection->beginTransaction();
        try {
            if ($model->load(Yii::$app->request->post())) {
                $data = Yii::$app->request->post();
                $model->deXuatKham = implode(' ', $data['Benhan']['deXuatKham']);
                if ($model->save()) {
                    $transaction->commit();
                    return $this->redirect(['view', 'id' => $model->id]);
                }
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
     * Updates an existing Benhan model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $connection = \Yii::$app->db;
        $transaction = $connection->beginTransaction();
        try {
            $model = $this->findModel($id);
            if ($model->load(Yii::$app->request->post())) {
                $data = Yii::$app->request->post();
                $model->deXuatKham = implode(' ', $data['Benhan']['deXuatKham']);
                if ($model->save()) {
                    return $this->redirect(['view', 'id' => $model->id]);
                }
            } else {
                return $this->render('update', [
                    'model' => $model,
                ]);
            }
        } catch (Exception $e) {
            $transaction->rollback();
            throw $e;
        }

    }


    /**
     * Deletes an existing Benhan model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {

        $hoso = $this->findModel($id)->maHS;
        $vienphi = Vienphi::findOne(['maBA' => $id]);
        if (!empty($vienphi)) {
            Vienphi::findOne(['maBA' => $id])->delete();
        }
        $donthuoc = Donthuoc::findOne(['maBA' => $id]);
        if (!empty($donthuoc))
            Donthuoc::findOne(['maBA' => $id])->delete();
        $this->findModel($id)->delete();

        return $this->redirect(["index?hoso={$hoso}"]);

    }

    /**
     * Finds the Benhan model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Benhan the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected
    function findModel($id)
    {
        if (($model = Benhan::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
