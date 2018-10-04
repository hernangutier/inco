<?php

use kartik\helpers\Html;
use kartik\helpers\Enum;
use kartik\grid\GridView;
use yii\widgets\Pjax;
use common\models\Bienes;
use yii\helpers\Url;
use yii\web\Response;
use kartik\widgets\Select2;
use yii\bootstrap\Modal;
use yii\web\View;
use yii\web\JsExpression;
use kartik\editable\Editable;
$url =Url::to(['bienes-list','id_mov'=>$searchModel->id,'id_und'=>$searchModel->id]);
use yii\helpers\ArrayHelper;
/* @var $this yii\web\View */
use kartik\widgets\ActiveForm;

/* @var $searchModel common\models\ComisionesDtSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */


 ?>





<?= GridView::widget([
  'dataProvider' => $dataProvider,
  //'filterModel'=>$searchModel,
  'responsive'=>true,
  'hover'=>true,
  'pjax'=>true,
  'pjaxSettings'=>[
      'neverTimeout'=>true,
      'options'=>[
        'id'=>'grid-movimientos-dt',
      ],
  ],
  'panel' => [
        'heading'=>'<h3 class="panel-title"><i class="fa fa-list-ol"></i> Facturas a Pagar</h3>',
        'type'=>'info',


        'footer'=>true,
    ],
    'toolbar' => [
  [
      'content'=>
      Html::a('<i class="glyphicon glyphicon-plus"></i>', ['create'], [
          'class' => 'btn btn-success',
          'title' => 'Cargar Factura'
      ]) . ' '.
      Html::a('<i class="glyphicon glyphicon-repeat"></i>', '#', [
          'class' => 'btn btn-primary refresh',
          'title' => 'Limpiar Filtros'
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
                'template' => '{delete}',
                'buttons' => [
                  'delete' => function ($url,$model, $key) {
                        $url=Url::to(['movimientos-dt/delete','id'=>$model->id]);
                        return  Html::a('<span class="btn btn-xs btn-danger"><i class="ace-icon fa fa-trash bigger-120"></i></span> ', '#', [
                            'title' => Yii::t('yii', 'Eliminar Items'),
                            'aria-label' => Yii::t('yii', 'Delete'),
                            'onclick' => "
                            krajeeDialog.confirm('Esta seguro de eliminar el Items:  ', function (result) {
                                 if (result) {
                                    $.ajax({

                                    url: '$url',
                                    type: 'POST',

                                    error : function(xhr, status) {

                                      //$('.alert-d-ant').html('<strong>Error!</strong> El Registro no se pudo eliminar').show().fadeOut(2000);
                                    },
                                    success: function (json){
                                      $.pjax.reload({container: '#grid-movimientos-dt'});
                                      //$('.alert-s-ant').html('<strong>Felicitaciones!</strong> El Registro a sido Eliminado con Exito').show().fadeOut(2000);
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
                'attribute'=>'nfact',
                'label'=>'N° de Factura','value'=>function ($searchModel, $key, $index, $widget) {
                    return Html::a($searchModel->nfact,
                        ['view','id'=>$searchModel->id],
                        ['title'=>'Ver Datos del Articulo' ]);
                },
                  'format'=>'raw'
            ],

            [
                'attribute'=>'id_client',
                'label'=>'Cliente','value'=>function ($searchModel, $key, $index, $widget) {
                    return $searchModel->client->getDatosHtml();

                },
                'format'=>'raw',

            ],

            [
                'attribute'=>'id_client',
                'label'=>'% Comision','value'=>function ($searchModel, $key, $index, $widget) {
                       return '<h3>' . $searchModel->client->percent_transport . '</h3>';

                },
                'format'=>'raw',

            ],
            [
                'attribute'=>'base_i',
                'label'=>'Base Imponible','value'=>function ($searchModel, $key, $index, $widget) {
                       return '<h3>' . number_format($searchModel->base_i,2) . '</h3>';

                },
                'format'=>'raw',

            ],
            [
              'attribute'=>'id_client',
              'label'=>'Monto a Pagar',
              'value'=>function($model){
                return '<h3 class="text-success">' . number_format(($model->client->percent_transport*$model->base_i)/100,2) . '</h3>';
              },
              'format'=>'raw',
            ]













      // 'fax',
      // 'email:email',
      // 'web',
      // 'contacto',
      // 'tel_contacto',


  ],
]); ?>
