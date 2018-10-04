<?php

namespace app\controllers;

use Yii;
use app\models\Marcas;
use app\models\MarcasSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * MarcasController implements the CRUD actions for Marcas model.
 */
class MarcasController extends Controller
{
    /**
     * {@inheritdoc]
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
  }


    public function actionMigrateData(){
      $data=[
        ['marca'=>'TREFYMACA','id'=>'79','margen'=>'0.00'],['marca'=>'TREXA','id'=>'80','margen'=>'0.00'],['marca'=>'TRICAL','id'=>'81','margen'=>'0.00'],
        ['marca'=>'TRIVOL','id'=>'82','margen'=>'0.00'],['marca'=>'TROEN','id'=>'83','margen'=>'0.00'],['marca'=>'TUBRICA','id'=>'84','margen'=>'0.00'],
        ['marca'=>'TUCSON TOOLS','id'=>'85','margen'=>'0.00'],['marca'=>'UNIPLAS','id'=>'86','margen'=>'0.00'],['marca'=>'UNIT PLAS','id'=>'87','margen'=>'0.00'],
        ['marca'=>'USA','id'=>'88','margen'=>'0.00'],['marca'=>'VENCERAMICA','id'=>'106','margen'=>'0.00'],['marca'=>'VERT','id'=>'100','margen'=>'0.00'],
        ['marca'=>'VICSON','id'=>'89','margen'=>'0.00'],['marca'=>'VIDON','id'=>'90','margen'=>'0.00'],['marca'=>'VINIL','id'=>'91','margen'=>'0.00']
      ];
      




      foreach ($data as  $value) {
        $model= new Marcas();
          $model->id=$value['id'];
          $model->descripcion=$value['marca'];
          $model->save();
      }
    }

    /**
     * Lists all Marcas models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new MarcasSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Marcas model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Marcas model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Marcas();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing Marcas model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing Marcas model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Marcas model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Marcas the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Marcas::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }

  }
