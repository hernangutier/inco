<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;
use yii\web\View;
use yii\helpers\Url;
use yii\web\JsExpression;
use kartik\widgets\DatePicker;
use \kartik\switchinput\SwitchInput;


/* @var $this yii\web\View */
/* @var $model common\models\Recepcion */
/* @var $form yii\widgets\ActiveForm */
$url =Url::to(['clientes-list']);
?>


<?php


//--------------- Script para la Consulta de los Articulos ----
$formatJs = <<< 'JS'
var formatRepo = function (city) {
  if (city.loading) {
      return city.razon;
  }
  var markup =
'<div class="row">' +
  '<div class="col-sm-3">' +
    '<h4><b/>' + city.cedrif + '</h4>' +
  '</div>' +
  '<div class="col-sm-6">' +

      '<h4><b style="margin-left:5px">' + city.razon + '</b></h4>' +
  '</div>' +

'</div>';

  return '<div style="overflow:hidden;">' + markup + '</div>';
};
JS;

$this->registerJs($formatJs, View::POS_HEAD);

 ?>


<div class="widget-box">
											<div class="widget-header">
												<h4 class="widget-title">Nuevo Despacho con Nota de Entrega</h4>
											</div>

											<div class="widget-body">
												<div class="widget-main no-padding">
													<?php $form = ActiveForm::begin(); ?>
														<!-- <legend>Form</legend> -->
														<fieldset>
                              <?php //-------------- Lineas -------------

                                 echo $form->field($model, 'id_client')->widget(Select2::classname(), [

                                      'size' => Select2::LARGE,
                                      'initValueText' => 'Consultar Clientes...',
                                      'language' => 'es',
                                      'options' => ['placeholder' => 'Seleccione el Cliente ...'],

                                      'addon' => [
                                        'append' => [
                                            'content' => Html::button('<i class="fa fa-plus"></i>',[
                                              'id' => 'activity-index-link',
                                              'class' => 'btn btn-success',
                                              'data-toggle' => 'modal',
                                              'data-target' => '#modal',
                                              'data-url' => Url::to(['clientes/modal']),
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
		                                     'templateSelection' => new JsExpression('function (city) { return city.cedrif + " " + city.razon; }'),
                                  ],
                                ]);

                              ?>
                          

                                <?= $form->field($model,'fecha')->widget(DatePicker::classname(), [
                                  'options' => ['placeholder' => 'Ingrese Fecha de  Entrega...'],
                                  'pluginOptions' => [
                                      'autoclose'=>true,
                                                  'format'=>'yyyy-mm-dd',
                                  ]
                                  ])
                                  ?>
                           
                               
                            


                          





                              <?= $form->field($model, 'motivo')->textarea(['rows' => 6]) ?>


														</fieldset>

														<div class="form-actions center">

                              <?= Html::submitButton('<i class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i> Guardar y Continuar ' , ['class' =>  'btn btn-sm btn-success' ]  ) ?>


														</div>
													<?php ActiveForm::end(); ?>
												</div>
											</div>
	</div>
