<?php

namespace app\controllers;

use Yii;
use app\models\Productos;
use app\models\ProductosSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use  yii\db\Query;
use yii\web\Response;
use yii\helpers\Url;
use yii\helpers\Json;
use yii\widgets\ActiveForm;
/**
 * ProductosController implements the CRUD actions for Productos model.
 */
class ProductosController extends Controller
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
     * Lists all Productos models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new ProductosSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);





        if (Yii::$app->request->post('hasEditable')) {
        // instantiate your book model for saving
        $dtId = Yii::$app->request->post('editableKey');
        $model = Productos::findOne($dtId);

        // store a default json response as desired by editable
        $out = Json::encode(['output'=>'', 'message'=>'']);

        // fetch the first entry in posted data (there should only be one entry
        // anyway in this array for an editable submission)
        // - $posted is the posted data for Book without any indexes
        // - $post is the converted array for single model validation
        $posted = current($_POST['Productos']);
        $post = ['detalle' => $posted];

        if (isset($posted['pvp'])){
            $model->pvp=$posted['pvp'];
            $output=$model->pvp;
            if ($model->save() ) {
              $out = Json::encode(['output'=>$output, 'message'=>'']);
              echo $out;
              return;
            }

        }

        if (isset($posted['min_venta'])){
            $model->min_venta=$posted['min_venta'];
            $output=$model->min_venta;
            if ($model->save() ) {
              $out = Json::encode(['output'=>$output, 'message'=>'']);
              echo $out;
              return;
            }

        }

        if (isset($posted['percent_utilidad'])){
            $model->percent_utilidad=$posted['percent_utilidad'];
            $output=$model->percent_utilidad;
            if ($model->save() ) {
              $out = Json::encode(['output'=>$output, 'message'=>'']);
              echo $out;
              return;
            }

        }

        if (isset($posted['is_public'])){
            $model->is_public=$posted['is_public'];
            $output=$model->is_public;
            if ($model->save() ) {
              $out = Json::encode(['output'=>$output, 'message'=>'']);
              echo $out;
              return;
            }

        }

        if (isset($posted['is_new'])){
            $model->is_new=$posted['is_new'];
            $output=$model->is_new;
            if ($model->save() ) {
              $out = Json::encode(['output'=>$output, 'message'=>'']);
              echo $out;
              return;
            }

        }


        if (isset($posted['categoria'])){
            $model->sexo=$posted['categoria'];
            $output=$model->sexo;
            if ($model->save() ) {
              $out = Json::encode(['output'=>$output, 'message'=>'']);
              echo $out;
              return;
            }

        }


  }

  $this->layout="main";

  return $this->render('index', [
      'searchModel' => $searchModel,
      'dataProvider' => $dataProvider,
  ]);


    }

    /**
     * Displays a single Productos model.
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
     * Creates a new Productos model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Productos();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['index']);
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing Productos model.
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
     * Deletes an existing Productos model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();


    }

    /**
     * Finds the Productos model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Productos the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Productos::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }

    public function actionModal($submit = false)
        {
          $model = new Productos();


            if (Yii::$app->request->isAjax && $model->load(Yii::$app->request->post()) && $submit == false) {
                Yii::$app->response->format = Response::FORMAT_JSON;
                return ActiveForm::validate($model);
            }

            if ($model->load(Yii::$app->request->post())) {
                if ($model->save()) {
                    $model->refresh();
                    Yii::$app->response->format = Response::FORMAT_JSON;
                    return [
                        'message' => '¡Éxito!',
                    ];
                } else {
                    Yii::$app->response->format = Response::FORMAT_JSON;
                    return ActiveForm::validate($model);
                }
    }

    return $this->renderAjax('_form_modal', [
        'model' => $model,
    ]);
}
}
