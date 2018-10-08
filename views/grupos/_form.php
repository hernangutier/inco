<?php

use yii\helpers\Html;
use kartik\widgets\ActiveForm;
use kartik\widgets\ActiveField;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;
use kartik\money\MaskMoney;

/* @var $this yii\web\View */
/* @var $model app\models\Grupos */
/* @var $form yii\widgets\ActiveForm */
?>


<?= ($model->isNewRecord) ? '<div class="widget-box widget-color-green" ><div class="widget-header">
	<h4 class="widget-title">Nuevo Grupo</h4>
</div>' : '<div class="widget-box widget-color-blue2" > <div class="widget-header">
	<h4 class="widget-title">Actualizar Grupo : ' . $model->ref . '</h4>
</div>' ?>




											<div class="widget-body">
												<div class="widget-main no-padding">

    <?php $form = ActiveForm::begin(); ?>

    <fieldset>


        <?php //-------------- Cargo -------------

                              echo $form->field($model, 'id_lin')->widget(Select2::classname(), [

                                   'data' => ArrayHelper::map(app\models\VwLineas::find()->asArray()->all(),'id','descripcion'),
                                   'language' => 'es',
                                   'size' => Select2::SMALL,
                                   'options' => ['placeholder' => 'Seleccione el la Linea'],
                                   'pluginOptions' => [
                                   'allowClear' => true
                                   ],
                                 ]);

                           ?>

          
        <?= $form->field($model, 'ref', [
          'addon' => ['prepend' => ['content'=>'<i class="fa fa-barcode"></i>']]
            ])->widget('yii\widgets\MaskedInput', [
            'mask' => '999'
        ])?>

          <?= $form->field($model, 'descripcion')->textInput(['maxlength' => true]) ?>





  
<div class="widget-toolbox padding-8 clearfix">
<div class="form-group">
    <?= Html::submitButton( ($model->isNewRecord) ? '<i class="ace-icon fa fa-floppy-o bigger-120 green "></i> Guardar' : '<i class="ace-icon fa fa-floppy-o bigger-120  "></i> Guardar' , ['class' => ($model->isNewRecord) ? 'btn btn-white btn-success btn-bold pull-right' : 'btn btn-white btn-primary btn-bold pull-right']  ) ?>
</div>
</div>
</fieldset>
    <?php ActiveForm::end(); ?>
  </div>
  </div>
