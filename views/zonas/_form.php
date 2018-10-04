<?php

use yii\helpers\Html;
use kartik\widgets\ActiveForm;
use kartik\widgets\ActiveField;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;
use kartik\money\MaskMoney;
/* @var $this yii\web\View */
/* @var $model app\models\Productos */
/* @var $form yii\widgets\ActiveForm */
?>


<?= ($model->isNewRecord) ? '<div class="widget-box widget-color-green" ><div class="widget-header">
	<h4 class="widget-title">Nueva Zona</h4>
</div>' : '<div class="widget-box widget-color-blue2" > <div class="widget-header">
	<h4 class="widget-title">Actualizar Zona : ' . $model->ref . '</h4>
</div>' ?>




											<div class="widget-body">
												<div class="widget-main no-padding">

    <?php $form = ActiveForm::begin(); ?>

    <fieldset>

    <div class="row">
      <div class="col-sm-4">
        <?= $form->field($model, 'ref', [
          'addon' => ['prepend' => ['content'=>'<i class="fa fa-barcode"></i>']]
            ])->widget('yii\widgets\MaskedInput', [
            'mask' => '999'
        ])?>
      </div>

      <div class="col-sm-8">
          <?= $form->field($model, 'denominacion')->textInput(['maxlength' => true]) ?>
      </div>
    </div>

    <div class="row">
      <div class="col-sm-6">
        <?= $form->field($model, 'descripcion')->textarea(['maxlength' => true]) ?>

      </div>
      <div class="col-sm-6">


      <?= $form->field($model, 'percent')->widget(MaskMoney::classname(), [
      'pluginOptions' => [
          'prefix' => '% ',
          'thousands' => '.',
          'affixesStay' => true,
          'decimal' => ',',
          'precision' => 2
      ]
      ]);
      ?>
      </div>
    </div>




  </div>
<div class="widget-toolbox padding-8 clearfix">
<div class="form-group">
    <?= Html::submitButton( ($model->isNewRecord) ? '<i class="ace-icon fa fa-floppy-o bigger-120 green "></i> Guardar' : '<i class="ace-icon fa fa-floppy-o bigger-120  "></i> Guardar' , ['class' => ($model->isNewRecord) ? 'btn btn-white btn-success btn-bold pull-right' : 'btn btn-white btn-primary btn-bold pull-right']  ) ?>
</div>
</div>
</fieldset>
    <?php ActiveForm::end(); ?>
  </div>
  </div>
