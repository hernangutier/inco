<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;
use kartik\widgets\DatePicker;
use \kartik\switchinput\SwitchInput;

/* @var $this yii\web\View */
/* @var $model common\models\Comisiones */
/* @var $form yii\widgets\ActiveForm */
?>


<div class="widget-box">
											<div class="widget-header">
												<h4 class="widget-title">Nuevo Calculo de Comisiones</h4>
											</div>

											<div class="widget-body">
												<div class="widget-main no-padding">
													<?php $form = ActiveForm::begin(); ?>
														<!-- <legend>Form</legend> -->
														<fieldset>
                              <?php //-------------- Lineas -------------

                                 echo $form->field($model, 'id_chof')->widget(Select2::classname(), [

                                      'data' => ArrayHelper::map(app\models\Choferes::find()->all(),'id',
                                           function($model, $defaultValue) {
                                              return  $model->cedrif . ' ' . $model->nombres;
                                      }
                              ),
                                      'language' => 'es',

                                      'options' => ['placeholder' => 'Seleccione el Proveedor ...'],
                                      'pluginOptions' => [
                                      'allowClear' => true
                                      ],

                                      ]);

                              ?>
                          <div class="row">

                            <div class="col-sm-6">

                                <?= $form->field($model,'date_ini')->widget(DatePicker::classname(), [
                                  'options' => ['placeholder' => 'Ingrese Fecha de  Cierre...'],
                                  'pluginOptions' => [
                                      'autoclose'=>true,
                                                  'format'=>'yyyy-mm-dd',
                                  ]
                                  ])
                                  ?>
                            </div>
                            <div class="col-sm-6">
                              <?= $form->field($model,'date_fin')->widget(DatePicker::classname(), [
                                'options' => ['placeholder' => 'Ingrese Fecha de  Cierre...'],
                                'pluginOptions' => [
                                    'autoclose'=>true,
                                                'format'=>'yyyy-mm-dd',
                                ]
                                ])
                                ?>
                            </div>
                          </div>










														</fieldset>

														<div class="form-actions center">

                              <?= Html::submitButton('<i class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i> Guardar y Continuar ' , ['class' =>  'btn btn-sm btn-success' ]  ) ?>


														</div>
													<?php ActiveForm::end(); ?>
												</div>
											</div>
	</div>
