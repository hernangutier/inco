<?php

use kartik\helpers\Html;
use kartik\grid\GridView;
use app\models\Marcas;
use app\models\Grupos;
use yii\helpers\Url;
use yii\helpers\ArrayHelper;
use kartik\select2\Select2;
use kartik\dialog\Dialog;
use yii\widgets\Pjax;
use kartik\editable\Editable;
use kartik\helpers\Enum;
use yii\bootstrap\Modal;
use app\models\Productos;
/* @var $this yii\web\View */
/* @var $searchModel app\models\ProductosSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Productos');
$this->params['breadcrumbs'][] = $this->title;
?>


<?php
    $this->registerJs("
           $(document).on('click', '#activity-index-link', (function() {
        $('.tl').text('Nuevo Producto');
        $.get(

            $(this).data('url'),
            function (data) {
                $('.modal-body').html(data);
                $('#modal-productos').modal();
            }
        );
    }));
    ");
?>

<?php
$this->registerJs("
  $(document).on('click', '.sinc', (function() {

    $.ajax({

    url: 'http://192.168.0.100/proteoerp/inventario/grup/getdata/',
    type: 'POST',
    data: JSON,
    error : function(xhr, status) {
      alert('Error en cargar datos');
    },
    success: function (data){
      alert(data.total);

      //$.pjax.reload({container: '#grid-tipos-doc'});

    },

  })



  }));
  ");
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


 <?php
Modal::begin([
    'id' => 'modal-productos',
    'options'=>[
      'tabindex'=>false,
    ],
    'header' => '<h4 class="blue bigger tl">Nuevo Articulo</h4>',

]);

echo "<div class='well'></div>";

Modal::end();
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
              'id'=>'grid-productos',
            ],
    ],

    'panel' => [
          'heading'=>'<h3 class="panel-title"><i class="fa fa-exclamation"></i> Productos</h3>',
          'type'=>'info',


          'footer'=>true
      ],

      'toolbar' => [
    [
        'content'=>
        Html::a('<i class="glyphicon glyphicon-plus"></i>', '#', [
            'class' => 'btn btn-success',
            'id' => 'activity-index-link',
            'data-toggle' => 'modal',
            'data-target' => '#modal',
            'data-url' => Url::to(['productos/modal']),
            'data-pjax' => '0',

            'title' => 'Registrar Producto'
        ]) . ' '.
            Html::a('<i class="ace-icon fa fa-file-pdf-o bigger-125"></i>','#', [
                'class' => 'btn btn-info sinc',
                'title' => 'Generar Listado de Precios'
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
                            Url::to(['productos/update','id'=>$model->id]), [
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
                              $url=Url::to(['productos/delete','id'=>$model->id]);
                              return Html::a('<span class="btn btn-xs btn-danger"><i class="ace-icon fa fa-trash bigger-120"></i></span> ', '#', [
                                  'title' => Yii::t('yii', 'Delete'),
                                  'aria-label' => Yii::t('yii', 'Delete'),
                                  'onclick' => "
                                  krajeeDialog.confirm('Esta seguro de eliminar el Producto:  ' +  '$model->ref', function (result) {
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



            'ref',
            'descripcion',
            [
    'attribute' => 'id_marca',
    'vAlign' => 'middle',
    'width' => '180px',
    'value' => function ($model, $key, $index, $widget) {
        return $model->marca->descripcion;

    },
    'filterType' => GridView::FILTER_SELECT2,
    'filter' => ArrayHelper::map(Marcas::find()->orderBy('descripcion')->asArray()->all(), 'id', 'descripcion'),
    'filterWidgetOptions' => [
        'pluginOptions' => ['allowClear' => true],
    ],
    'filterInputOptions' => ['placeholder' => 'No Filtro'],
    'format' => 'raw'
  ],
            [
              'attribute'=>'id_grupo',
              'label'=>'Grupo de Inventario',
              'value'=>function($searchModel){
                return isset($searchModel->grupo) ? Html::bsLabel('<b>'. $searchModel->grupo->descripcion . '</b>', Html::TYPE_PRIMARY)  : Html::bsLabel('No Ubicado', Html::TYPE_WARNING);
              },
              'filterType' => GridView::FILTER_SELECT2,
              'filter' => ArrayHelper::map(Grupos::find()->orderBy('descripcion')->asArray()->all(), 'id', 'descripcion'),
              'filterWidgetOptions' => [
                  'pluginOptions' => ['allowClear' => true],
              ],
              'filterInputOptions' => ['placeholder' => 'No Filtro'],
              'format' => 'raw'
            ],

            [
              'class'=>'kartik\grid\EditableColumn',
              'attribute'=>'pvp',
              'editableOptions'=>[
                  'header'=>'PVP S/Iva BsS.',
                  //'inputType'=>\kartik\editable\Editable::INPUT_SPIN,
                  //'options'=>['pluginOptions'=>['min'=>0, 'max'=>5000]],
                  'asPopover' => false,
              ],
              'hAlign'=>'right',
              'vAlign'=>'middle',
              'width'=>'100px',
              'format'=>['decimal', 2],

          ],
          /*
          [
            'class'=>'kartik\grid\EditableColumn',
            'attribute'=>'percent_utilidad',
            'editableOptions'=>[
                'header'=>'% Utilidad',
                //'inputType'=>\kartik\editable\Editable::INPUT_SPIN,
                //'options'=>['pluginOptions'=>['min'=>0, 'max'=>5000]],
                'asPopover' => false,
            ],
            'hAlign'=>'right',
            'vAlign'=>'middle',
            'width'=>'100px',
            'format'=>['decimal', 2],

        ],
        */
        /*
        [
    'class' => '\kartik\grid\FormulaColumn',
    'header' => 'PVP BsS.',
    'value' => function ($model, $key, $index, $widget) {
        $p = compact('model', 'key', 'index');
        // Write your formula below
        return $widget->col(6, $p) /((100-$widget->col(7, $p))/100);
      },
      'format'=>['decimal', 2],
      'mergeHeader' => true,
      'pageSummary' => true,

    ],
    */


          [
        'class'=>'kartik\grid\EditableColumn',
        'attribute'=>'is_public',
        'filter' => Html::activeDropDownList($searchModel,
        'is_public', Enum::boolList('No', 'Si') ,
        ['class'=>'form-control','prompt' => 'No Filtro']),
        'editableOptions'=>[
            'header'=>'Publicado',
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


        ],
    ]); ?>
