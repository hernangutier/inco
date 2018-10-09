<?php

use yii\helpers\Html;
use kartik\widgets\ActiveForm;
use kartik\widgets\ActiveField;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */
/* @var $model app\models\Productos */
/* @var $form yii\widgets\ActiveForm */
?>


<?= ($model->isNewRecord) ? '<div class="widget-box widget-color-green" ><div class="widget-header">
	<h4 class="widget-title">Nuevo Producto</h4>
</div>' : '<div class="widget-box widget-color-blue2" > <div class="widget-header">
	<h4 class="widget-title">Actualizar Producto : ' . $model->descripcion . '</h4>
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
            'mask' => '999-999'
        ])?>
      </div>

      <div class="col-sm-8">
          <?= $form->field($model, 'descripcion')->textarea(['maxlength' => true]) ?>
      </div>
    </div>

    <div class="row">
      <div class="col-sm-6">
        <?php //-------------- Cargo -------------

                              echo $form->field($model, 'id_marca')->widget(Select2::classname(), [

                                   'data' => ArrayHelper::map(app\models\Marcas::find()->asArray()->all(),'id','descripcion'),
                                   'language' => 'es',
                                   'size' => Select2::SMALL,
                                   'options' => ['placeholder' => 'Seleccione la Marca'],
                                   'pluginOptions' => [
                                   'allowClear' => true
                                   ],
                                 ]);

                           ?>

      </div>
      <div class="col-sm-6">
        <?php //-------------- Cargo -------------

                              echo $form->field($model, 'id_grupo')->widget(Select2::classname(), [

                                   'data' => ArrayHelper::map(app\models\Grupos::find()->asArray()->all(),'id','descripcion'),
                                   'language' => 'es',
                                   'size' => Select2::SMALL,
                                   'options' => ['placeholder' => 'Grupo de Inventario'],
                                   'pluginOptions' => [
                                   'allowClear' => true
                                   ],
                                 ]);

                           ?>
      </div>
    </div>

    
      <?php //-------------- Cargo -------------

                              echo $form->field($model, 'id_ubic')->widget(Select2::classname(), [

                                   'data' => ArrayHelper::map(app\models\VwUbicaciones::find()->asArray()->all(),'id','ubicacion'),
                                   'language' => 'es',
                                   'size' => Select2::SMALL,
                                   'options' => ['placeholder' => 'Grupo de Inventario'],
                                   'pluginOptions' => [
                                   'allowClear' => true
                                   ],
                                 ]);

        ?>
     


	<div class="row">
		<div class="col-sm-6">
			  <?= $form->field($model, 'und')->textInput(['maxlength' => true]) ?>
		</div>
		<div class="col-sm-6">
				<?= $form->field($model, 'min_venta')->textInput(['maxlength' => true]) ?>
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
