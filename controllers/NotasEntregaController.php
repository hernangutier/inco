<?php

namespace app\controllers;

use Yii;
use app\models\NotasEntrega;
use app\models\NotasEntregaSearch;
use app\models\NotasEntregaDetailSearch;
use app\models\NotasEntregaDetail;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use  yii\db\Query;
use yii\web\Response;
use yii\helpers\Url;
use yii\helpers\Json;

/**
 * NotasEntregaController implements the CRUD actions for NotasEntrega model.
 */
class NotasEntregaController extends Controller
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
     * Lists all NotasEntrega models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new NotasEntregaSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }


    public function actionView($id)
    {
           // validate if there is a editable input saved via AJAX
    if (Yii::$app->request->post('hasEditable')) {
        // instantiate your book model for saving
        $dtId = Yii::$app->request->post('editableKey');
        $model = NotasEntregaDetail::findOne($dtId);

        // store a default json response as desired by editable
        $out = Json::encode(['output'=>'', 'message'=>'']);

        // fetch the first entry in posted data (there should only be one entry
        // anyway in this array for an editable submission)
        // - $posted is the posted data for Book without any indexes
        // - $post is the converted array for single model validation
        $posted = current($_POST['NotasEntregaDetail']);
        $post = ['detalle' => $posted];

        if (isset($posted['cnt'])){
            $model->cnt=$posted['cnt'];
            $output=$model->cnt;
            if ($model->save() ) {
              $out = Json::encode(['output'=>$output, 'message'=>'']);
              echo $out;
              return;
            }

        }

         

        

      }

      $searchModel = new NotasEntregaDetailSearch();
      $searchModel->id_not=$id;
      $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        
        return $this->render('view', [
            'model' => $this->findModel($id),
            'searchModel'=>$searchModel,
            'dataProvider'=>$dataProvider
        ]);

      }  

    /**
     * Displays a single NotasEntrega model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    

    /**
     * Creates a new NotasEntrega model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new NotasEntrega();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing NotasEntrega model.
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
     * Deletes an existing NotasEntrega model.
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
     * Finds the NotasEntrega model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return NotasEntrega the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = NotasEntrega::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }


    public function actionClientesList($q = null, $id = null) {
    \Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
    $out = ['results' => ['id' => '', 'cedrif' => '','razon'=>'']];
    if (!is_null($q)) {
        $query = new Query;
        $query->select('*')
            ->from('vw_clientes')
            ->where(['like', 'tostring', $q])
            ->limit(40);
        $command = $query->createCommand();
        $data = $command->queryAll();
        $out['results'] = array_values($data);
    }
    elseif ($id > 0) {
        $out['results'] = ['id' => $id, 'cedrif'=>Clientes::find($id)->cedrif, 'razon' => Clientes::find($id)->razon];
    }
    return $out;
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
      $model= new NotasEntregaDetail();
        $model->id_not=$id_trans;
        $model->id_prod=$id_prod;
        $model->cnt=1;
        
        

        
        

        if ($model->save()){
          return $error=false;
        } else {
          return $error=true;
        }
    }


}
