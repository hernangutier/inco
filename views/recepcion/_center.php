<?php

use kartik\helpers\Html;
use kartik\helpers\Enum;
use kartik\grid\GridView;
use yii\widgets\Pjax;
use common\models\Productos;
use yii\helpers\Url;
use yii\web\Response;
use kartik\widgets\Select2;
use yii\bootstrap\Modal;
use yii\web\View;
use yii\web\JsExpression;
use kartik\editable\Editable;
$url =Url::to(['product-list','id_in'=>$searchModel->idMov->id,'id_und'=>$searchModel->idMov->id_und_origen]);
use yii\helpers\ArrayHelper;
/* @var $this yii\web\View */
use kartik\widgets\ActiveForm;

/* @var $searchModel common\models\MovimientosDtSearch */
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


($searchModel->idMov->status==0 ?
Select2::widget([
    'name' => 'id_prod',
    'value' => '1',
    'size' => Select2::LARGE,
    'initValueText' => 'Consultar Bienes...',
    'options' => ['placeholder' => 'Buscar Bienes'],


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
       'templateSelection' => new JsExpression('function (city) { return city.codigo + " " + city.descripcion; }'),
    ],

    'pluginEvents' => [

        "select2:select" => "function() {

          // creamos peticion ajax ----
          $.ajax(
                {
                  url : 'index.php?r=procesos%2Fmovimientos%2Fadd-items',
                  type: 'GET',
                  data : {'id_mov': '$searchModel->id_mov', 'id_bien':$(this).val()},
                  DataType:'JSON',
                })
                  .done(function(data) {
                    if (data.result==null){
                        $.pjax.reload({container:'#grid-movimientos-dt'});
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
        'id'=>'grid-movimientos-dt',
      ],
  ],
  'panel' => [
        'heading'=>'<h3 class="panel-title"><i class="fa fa-list-ol"></i> Detalles del Movimiento</h3>',
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
                        $url=Url::to(['movimientos-dt/delete','id'=>$model->id]);
                        return ($model->idMov->status==0 ? Html::a('<span class="btn btn-xs btn-danger"><i class="ace-icon fa fa-trash bigger-120"></i></span> ', '#', [
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
                        ]) : '');
                    },

                    ],
            ],

            [
                  'class' => 'yii\grid\ActionColumn',
                  'template' => '{desvincular}',
                  'buttons' => [
                    'desvincular' => function ($url,$model, $key) {
                          $url1=Url::to(['movimientos-dt/desvincular-user','id'=>$model->id]);
                          return  (isset($model->id_user_new) ? Html::a('<span class="btn btn-xs btn-danger"><i class="ace-icon fa fa-user-times bigger-120"></i></span> ', '#', [
                              'title' => Yii::t('yii', 'Desvincular Nuevo Usuario'),
                              'aria-label' => Yii::t('yii', 'Delete'),
                              'onclick' => "
                              krajeeDialog.confirm('Esta seguro de Desvincular el Nuevo Usuario  ', function (result) {
                                   if (result) {
                                      $.ajax({

                                      url: '$url1',
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
                          ]) : '');
                      },

                      ],
              ],


            [
                'attribute'=>'id_bien',
                'label'=>'Referencia','value'=>function ($searchModel, $key, $index, $widget) {
                    return Html::a($searchModel->idBien->codigo,
                        ['view','id'=>$searchModel->id],
                        ['title'=>'Ver Datos del Articulo' ]);
                },
                  'format'=>'raw'
            ],

            [
                'attribute'=>'id_bien',
                'label'=>'Descripcion','value'=>function ($searchModel, $key, $index, $widget) {
                    return $searchModel->idBien->descripcion;

                },

            ],

            [
              'attribute'=>'id_art',
              'label'=>'Usuario Actual',
              'value'=>function($searchModel){
                return $searchModel->idBien->getUserActual();
              }

            ],


            [
              'class'=>'kartik\grid\EditableColumn',
              'attribute'=>'id_und_destino',

              'editableOptions'=>[
                  'header'=>'Existencia',
                  'asPopover' => false,
                  'inputType'=>Editable :: INPUT_SELECT2,
                  'options'=>[
                    'data'=> ArrayHelper::map(common\models\UnidadesAdmin::find()->all(),'id',function($model, $defaultValue) {
                              return $model->descripcion;
                            }
                      ),
                  ],


                    'displayValueConfig'=> ArrayHelper::map(common\models\UnidadesAdmin::find()->all(),'id','descripcion'),

                  //'options'=>['pluginOptions'=>['min'=>0, 'max'=>5000]],

              ],
              'hAlign'=>'right',
              'vAlign'=>'middle',
              'width'=>'100px',
              //'format'=>['decimal', 2],

          ],

          [
            'class'=>'kartik\grid\EditableColumn',
            'attribute'=>'is_colectivo',
            'filter' => Html::activeDropDownList($searchModel,
            'is_colectivo', Enum::boolList('No', 'Si') ,
            ['class'=>'form-control','prompt' => 'No Filtro']),
            'editableOptions'=>[
                'header'=>'Uso Colectivo',
                'asPopover' => false,
                'inputType'=>Editable :: INPUT_DROPDOWN_LIST,
                'data' => [0 => 'No', 1 => 'Si'],
                'options' => ['class'=>'form-control', 'prompt'=>'Selecionar...'],
                'displayValueConfig'=> [
                    '1' => '<i class="ace-icon fa fa-check green bigger-160"></i>',
                    '0' => '<i class="ace-icon fa fa-times red2 bigger-160"></i>'
                ],

            ],
            'hAlign'=>'center',
            'vAlign'=>'middle',
            'width'=>'200px',
          ],


            [
              'class'=>'kartik\grid\EditableColumn',

              'attribute'=>'id_user_new',

              'editableOptions'=>function ($model, $key, $index){

                  return [
                  'header'=>'Responsable Directo',
                  'inputType'=>Editable :: INPUT_SELECT2,
                  'options'=>[
                  'data'=> ArrayHelper::map(common\models\Responsables::find()->where(['id_unidad'=>$model->id_und_destino])->andWhere(['activo'=>true])->all(),'id',function($model, $defaultValue) {
                            return $model->getNombreCompleto();
                          }
                        ),
                        'pluginOptions' => [
                            'allowClear' => true
                        ],
                  ],
                  'displayValueConfig'=> ArrayHelper::map(common\models\Responsables::find()->all(),'id','nombres'),
                  //'options'=>['pluginOptions'=>['min'=>0, 'max'=>5000]],
                  'asPopover' => false,
              ];
              },
              'hAlign'=>'right',
              'vAlign'=>'middle',
              'width'=>'100px',
              'format'=>['decimal', 2],

              ],

              [
                'class'=>'kartik\grid\EditableColumn',
                'attribute'=>'estado_fisico',

                'editableOptions'=>[

                    'asPopover' => false,
                    'inputType'=>\kartik\editable\Editable::INPUT_DROPDOWN_LIST,
                    'data'=> Bienes::getListEstadosFisico(),

                      'displayValueConfig'=> Bienes::getListEstadosFisico(),

                    //'options'=>['pluginOptions'=>['min'=>0, 'max'=>5000]],

                ],
                'hAlign'=>'right',
                'vAlign'=>'middle',
                'width'=>'100px',
                //'format'=>['decimal', 2],

            ],


      // 'fax',
      // 'email:email',
      // 'web',
      // 'contacto',
      // 'tel_contacto',


  ],
]); ?>
