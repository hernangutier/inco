<?php

use yii\helpers\Html;
use kartik\grid\GridView;
use yii\helpers\Url;
use app\models\Proveedores;
use yii\helpers\ArrayHelper;
use kartik\select2\Select2;
use kartik\dialog\Dialog;
use yii\widgets\Pjax;
/* @var $this yii\web\View */
/* @var $searchModel app\models\RecepcionSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Recepcion de Mercancia');
$this->params['breadcrumbs'][] = $this->title;
?>

<?php
     $this->registerJs('
      $(document).ready(function() {
        window.history.pushState(null, "", window.location.href);
        window.onpopstate = function() {
           window.history.pushState(null, "", window.location.href);
         };
       })

     ');
 ?>

<?php echo Dialog::widget(); ?>





  <?= GridView::widget([
    'dataProvider' => $dataProvider,
    'filterModel'=>$searchModel,
    'responsive'=>true,
    'hover'=>true,
    'pjax'=>true,
    'pjaxSettings'=>[
        'neverTimeout'=>true,
        'options'=>[
          'id'=>'grid-tipos-doc',
        ],
    ],
    'panel' => [
          'heading'=>'<h3 class="panel-title"><i class="fa fa-exclamation"></i> Recepcion de Pedidos</h3>',
          'type'=>'info',


          'footer'=>false
      ],

      'toolbar' => [
    [
        'content'=>
        Html::a('<i class="glyphicon glyphicon-plus"></i>', ['create'], [
            'class' => 'btn btn-success',
            'title' => 'Registrar Pedido'
        ]) . ' '.
            Html::a('<i class="ace-icon fa fa-file-pdf-o bigger-125"></i>', ['grid-demo'], [
                'class' => 'btn btn-info',
                'title' => 'Listado'
            ]),

    ],
    '{export}',
    '{toggleData}'
],

        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],



              [
                  'class' => 'yii\grid\ActionColumn',
                  'template' => '{update}',
                  'buttons' => [
                    'update' => function ($url, $model, $key) {
                        return Html::a('<span class="btn btn-xs btn-primary"><i class="ace-icon fa fa-refresh bigger-120"></i></span> ',
                            Url::to(['recepcion/update','id'=>$model->id]), [
                            'id' => 'activity-index-link',
                            'title' => Yii::t('app', 'Actualizar'),

                      ]);
                  },

                ],
                ],

                [
                      'class' => 'yii\grid\ActionColumn',
                      'template' => '{delete}',
                      'buttons' => [
                        'delete' => function ($url,$model, $key) {
                              $url=Url::to(['archivo-doc-tipos/delete','id'=>$model->id]);
                              return Html::a('<span class="btn btn-xs btn-danger"><i class="ace-icon fa fa-trash bigger-120"></i></span> ', '#', [
                                  'title' => Yii::t('yii', 'Delete'),
                                  'aria-label' => Yii::t('yii', 'Delete'),
                                  'onclick' => "
                                  krajeeDialog.confirm('Esta seguro de eliminar el Tipo de Documento:  ' +  '$model->nfact', function (result) {
                                       if (result) {
                                          $.ajax({

                                          url: '$url',
                                          type: 'POST',

                                          error : function(xhr, status) {
                                            $('.alert-d-ant').html('<strong>Error!</strong> El Registro no se pudo eliminar').show().fadeOut(2000);
                                          },
                                          success: function (json){
                                            $.pjax.reload({container: '#grid-tipos-doc'});
                                            $('.alert-s-ant').html('<strong>Felicitaciones!</strong> El Registro a sido Eliminado con Exito').show().fadeOut(2000);
                                          },

                                      });
                                    }
                                  });
                                      return false;
                                  ",
                              ]);
                          },

                          ],
                  ],


            [
              'attribute'=>'ncontrol',
              'value'=>function($model){
                return $model->getNControlFormat();
              }
            ],
            'nfact',
            'date_recive',
            ['attribute'=>'id_prov',
              'value'=>function($model){
                return $model->prov->razon;
              },
              'filterType' => GridView::FILTER_SELECT2,
              'filter' => ArrayHelper::map(Proveedores::find()->orderBy('rif')->asArray()->all(), 'id', 'razon'),
              'filterWidgetOptions' => [
                  'pluginOptions' => ['allowClear' => true],
              ],
              'filterInputOptions' => ['placeholder' => 'No Filtro'],
              'format' => 'raw'

            ],
            'observaciones',
            ['attribute'=>'is_incidencia',
              'value'=>function($model){
                return $model->getIncidenciaHtml();
              },
              'format'=>'raw',
            ],

        ],
    ]); ?>
