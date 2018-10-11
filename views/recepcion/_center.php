<?php

use kartik\helpers\Html;
use kartik\helpers\Enum;
use kartik\grid\GridView;
use yii\widgets\Pjax;
use app\models\Productos;
use yii\helpers\Url;
use yii\web\Response;
use kartik\widgets\Select2;
use yii\bootstrap\Modal;
use yii\web\View;
use yii\web\JsExpression;
use kartik\editable\Editable;
$url =Url::to(['productos-list']);
use yii\helpers\ArrayHelper;
/* @var $this yii\web\View */
use kartik\widgets\ActiveForm;

/* @var $searchModel common\models\RecepcionesDetailSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */


 ?>

<?php


//--------------- Script para la Consulta de los Articulos ----
$formatJs = <<< 'JS'
var formatRepo = function (city) {
  if (city.loading) {
      return city.descripcion;
  }
  var markup =
'<div class="row">' +
  '<div class="col-sm-3">' +
    '<h4><b/>' + city.ref + '</h4>' +
  '</div>' +
  '<div class="col-sm-6">' +

      '<h4><b style="margin-left:5px">' + city.descripcion + '</b></h4>' +
  '</div>' +

'</div>';

  return '<div style="overflow:hidden;">' + markup + '</div>';
};
JS;

$this->registerJs($formatJs, View::POS_HEAD);

 ?>


<?=


($searchModel->recep->status==0 ?
Select2::widget([
    'name' => 'id_prod',
    'value' => '1',
    'size' => Select2::LARGE,
    'initValueText' => 'Consultar Productos...',
    'options' => ['placeholder' => 'Buscar Productos'],

    'addon' => [
      'append' => [
          'content' => Html::button('<i class="fa fa-plus"></i>',[
            'id' => 'activity-index-link',
            'class' => 'btn btn-success',
            'data-toggle' => 'modal',
            'data-target' => '#modal',
            'data-url' => Url::to(['productos/modal']),
            'data-pjax' => '0',
          ]),
            'asButton' => true
        ]
    ],


    'pluginOptions' => [
        'allowClear' => true,
        'minimumInputLength' => 1,
        'ajax' => [
            'url' => $url,
            'dataType' => 'json',
            'delay' => 250,
            'data' => new JsExpression('function(params) { return {q:params.term, page: params.page}; }'),

        ],
        'escapeMarkup' => new JsExpression('function (markup) { return markup; }'),
       'templateResult' => new JsExpression('formatRepo'),
       'templateSelection' => new JsExpression('function (city) { return city.ref + " " + city.descripcion; }'),
    ],

    'pluginEvents' => [

        "select2:select" => "function() {

          // creamos peticion ajax ----
          $.ajax(
                {
                  url : 'index.php?r=recepcion%2Fadd-items',
                  type: 'GET',
                  data : {'id_trans': '$searchModel->id_recep', 'id_prod':$(this).val()},
                  DataType:'JSON',
                })
                  .done(function(data) {
                    if (data.result==null){
                        $.pjax.reload({container:'#grid-recepciones-detail'});
                    }  else {
                      krajeeDialog.alert(data.result);
                    }


                  })
                  .fail(function(data) {
                    alert( 'Ocurrio un Error...' );
                  })
                  .always(function(data) {
                    //alert( 'complete' );
            });

        }",

        "select2:unselect" => "function() {itemSelected=null;
          $('.detalle').hide();
        }"
    ],


]) : '');




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
        'id'=>'grid-recepciones-detail',
      ],
  ],
  'panel' => [
        'heading'=>'<h3 class="panel-title"><i class="fa fa-list-ol"></i> Productos Recibidos</h3>',
        'type'=>'info',


        'footer'=>true,
    ],
    'toolbar' => [
  [
      'content'=>

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
                        $url=Url::to(['recepciones-detail/delete','id'=>$model->id]);
                        return ($model->recep->status==0 ? Html::a('<span class="btn btn-xs btn-danger"><i class="ace-icon fa fa-trash bigger-120"></i></span> ', '#', [
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
                                      $.pjax.reload({container: '#grid-recepciones-detail'});
                                      //$('.alert-s-ant').html('<strong>Felicitaciones!</strong> El Registro a sido Eliminado con Exito').show().fadeOut(2000);
                                    },

                                });
                              }
                            });
                                return false;
                            ",
                        ]) : '');
                    },

                    ],
            ],

            

            [
                'attribute'=>'id_prod',
                'label'=>'Catalogo','value'=>function ($searchModel, $key, $index, $widget) {
                    return Html::a($searchModel->prod->ref,
                        ['view','id'=>$searchModel->id],
                        ['title'=>'Ver Datos del Articulo' ]);
                },
                  'format'=>'raw'
            ],

            [
                'attribute'=>'id_prod',
                'label'=>'Descripcion','value'=>function ($searchModel, $key, $index, $widget) {
                    return $searchModel->prod->descripcion;

                },

            ],

            

            [
              'class' => 'kartik\grid\EditableColumn',
              'attribute' => 'cnt_facturada', 
              'readonly' => function($model, $key, $index, $widget) {
                  return ($model->recep->status); // do not allow editing of inactive records
              },
              'editableOptions' => [
                  'header' => 'Facturada',
                  'asPopover' => false, 
                  'inputType' => \kartik\editable\Editable::INPUT_SPIN,
                  'options' => [
                      'pluginOptions' => ['min' => 0, 'max' => 5000]
                  ]
              ],
              'hAlign' => 'right', 
              'vAlign' => 'middle',
              'width' => '20%',
              'format' => ['decimal', 2],
              'pageSummary' => true
          ],

          [
              'class' => 'kartik\grid\EditableColumn',
              'attribute' => 'cnt_recibida', 
              'readonly' => function($model, $key, $index, $widget) {
                  return ($model->recep->status); // do not allow editing of inactive records
              },
              'editableOptions' => [
                  'header' => 'Recibida',
                  'asPopover' => false, 
                  'inputType' => \kartik\editable\Editable::INPUT_SPIN,
                  'options' => [
                      'pluginOptions' => ['min' => 0, 'max' => 5000]
                  ]
              ],
              'hAlign' => 'right', 
              'vAlign' => 'middle',
              'width' => '20%',
              'format' => ['decimal', 2],
              'pageSummary' => true
          ],  

          [
              'class' => 'kartik\grid\EditableColumn',
              'attribute' => 'cnt_defect', 
              'readonly' => function($model, $key, $index, $widget) {
                  return ($model->recep->status); // do not allow editing of inactive records
              },
              'editableOptions' => [
                  'header' => 'Cnt. Defect.',
                  'asPopover' => false, 
                  'inputType' => \kartik\editable\Editable::INPUT_SPIN,
                  'options' => [
                      'pluginOptions' => ['min' => 0, 'max' => 5000]
                  ]
              ],
              'hAlign' => 'right', 
              'vAlign' => 'middle',
              'width' => '20%',
              'format' => ['decimal', 2],
              'pageSummary' => true
          ],  
      // 'web',
      // 'contacto',
      // 'tel_contacto',


  ],
]); ?>
