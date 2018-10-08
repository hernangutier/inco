<?php

namespace app\controllers;

use Yii;
use app\models\Recepcion;
use app\models\Productos;
use app\models\Proveedores;
use app\models\RecepcionesDetail;
use app\models\RecepcionesDetailSearch;
use app\models\RecepcionSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use  yii\db\Query;
use yii\web\Response;
use yii\helpers\Url;
use yii\helpers\Json;

/**
 * RecepcionController implements the CRUD actions for Recepcion model.
 */
class RecepcionController extends Controller
{
    /**
     * {@inheritdoc}
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

    /**
     * Lists all Recepcion models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new RecepcionSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    public function actionProcesar($id){

      \Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
      $model=$this->findModel($id);
        $model->status=1;
          if ($model->save()){
            return $err=false;
          } else {
            return $err=true;
          }
    }

    /**
     * Displays a single Recepcion model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
           // validate if there is a editable input saved via AJAX
    if (Yii::$app->request->post('hasEditable')) {
        // instantiate your book model for saving
        $dtId = Yii::$app->request->post('editableKey');
        $model = RecepcionesDetail::findOne($dtId);

        // store a default json response as desired by editable
        $out = Json::encode(['output'=>'', 'message'=>'']);

        // fetch the first entry in posted data (there should only be one entry
        // anyway in this array for an editable submission)
        // - $posted is the posted data for Book without any indexes
        // - $post is the converted array for single model validation
        $posted = current($_POST['RecepcionesDetail']);
        $post = ['detalle' => $posted];

        if (isset($posted['cnt_facturada'])){
            $model->cnt_facturada=$posted['cnt_facturada'];
            $output=$model->cnt_facturada;
            if ($model->save() ) {
              $out = Json::encode(['output'=>$output, 'message'=>'']);
              echo $out;
              return;
            }

        }

        if (isset($posted['cnt_recibida'])){
            $model->cnt_recibida=$posted['cnt_recibida'];
            $output=$model->cnt_recibida;
            if ($model->save() ) {
              $out = Json::encode(['output'=>$output, 'message'=>'']);
              echo $out;
              return;
            }

        }

      }

      $searchModel = new RecepcionesDetailSearch();
      $searchModel->id_recep=$id;
      $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        
        return $this->render('view', [
            'model' => $this->findModel($id),
            'searchModel'=>$searchModel,
            'dataProvider'=>$dataProvider
        ]);

      }  

        


       
    /**
     * Creates a new Recepcion model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Recepcion();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing Recepcion model.
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
     * Deletes an existing Recepcion model.
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
     * Finds the Recepcion model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Recepcion the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Recepcion::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }

    public function actionProductosList($q = null, $id = null) {
    \Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
    $out = ['results' => ['id' => '', 'ref' => '','descripcion'=>'']];
    if (!is_null($q)) {
        $query = new Query;
        $query->select('*')
            ->from('vw_productos')
            ->where(['like', 'tostring', $q])
            ->limit(40);
        $command = $query->createCommand();
        $data = $command->queryAll();
        $out['results'] = array_values($data);
    }
    elseif ($id > 0) {
        $out['results'] = ['id' => $id, 'codigo'=>Productos::find($id)->codigo, 'descripcion' => Productos::find($id)->descripcion];
    }
    return $out;
    }

    public function actionAddItems($id_trans,$id_prod)
    {
      
      Yii::$app->response->format = Response::FORMAT_JSON;
      $model= new RecepcionesDetail();
        $model->id_recep=$id_trans;
        $model->id_prod=$id_prod;
        $model->cnt_facturada=1;
        $model->cnt_recibida=1;
        

        
        

        if ($model->save()){
          return $error=false;
        } else {
          return $error=true;
        }
    }



    public function actionProvidersList($q = null, $id = null) {
    \Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
    $out = ['results' => ['id' => '', 'rif' => '','razon'=>'']];
    if (!is_null($q)) {
        $query = new Query;
        $query->select('*')
            ->from('vw_providers')
            ->where(['like', 'tostring', $q])
            ->limit(40);
        $command = $query->createCommand();
        $data = $command->queryAll();
        $out['results'] = array_values($data);
    }
    elseif ($id > 0) {
        $out['results'] = ['id' => $id, 'rif'=>Proveedores::find($id)->rif, 'razon' => Proveedores::find($id)->razon];
    }
    return $out;
    }


    



}
