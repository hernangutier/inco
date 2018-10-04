<?php

use yii\helpers\Html;
use kartik\widgets\ActiveForm;
use kartik\widgets\ActiveField;
use common\models\Archivo;
use app\models\Zonas;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;
use \kartik\switchinput\SwitchInput;
use kartik\dialog\Dialog;
use kartik\helpers\Enum;
use kartik\money\MaskMoney;


/* @var $this yii\web\View */
/* @var $model common\models\Clientes */
/* @var $form yii\widgets\ActiveForm */
?>

<?php echo Dialog::widget(); ?>



    <?php $form = ActiveForm::begin(); ?>
<fieldset>

    <?= $form->field($model, 'cedrif', [
      'addon' => ['prepend' => ['content'=>'<i class="fa fa-barcode"></i>']]
        ])->widget('yii\widgets\MaskedInput', [
        'mask' => 'A99999999'
    ])?>



		<?= $form->field($model, 'razon')->textarea(['maxlength' => true]) ?>
    <?= $form->field($model, 'direccion')->textarea(['maxlength' => true]) ?>
<div class="row">
  <div class="col-sm-6">
    <?php //-------------- Cargo -------------

                          echo $form->field($model, 'id_zona')->widget(Select2::classname(), [

                               'data' => ArrayHelper::map(app\models\Zonas::find()->asArray()->all(),'id','denominacion'),
                               'language' => 'es',
                               'size' => Select2::SMALL,
                               'options' => ['placeholder' => 'Seleccione la Zona'],
                               'pluginOptions' => [
                               'allowClear' => true
                               ],
                             ]);

                       ?>

  </div>
  <div class="col-sm-6">
    <?= $form->field($model, 'percent_transport')->widget(MaskMoney::classname(), [
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









		<div class="widget-toolbox padding-8 clearfix">
			<div class="form-group">
					<?= Html::submitButton( ($model->isNewRecord) ? '<i class="ace-icon fa fa-floppy-o bigger-120 green "></i> Guardar' : '<i class="ace-icon fa fa-floppy-o bigger-120  "></i> Guardar' , ['class' => ($model->isNewRecord) ? 'btn btn-white btn-success btn-bold pull-right' : 'btn btn-white btn-primary btn-bold pull-right']  ) ?>
			</div>
		</div>

</fieldset>
    <?php ActiveForm::end(); ?>
