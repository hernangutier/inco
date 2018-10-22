<?php

use yii\helpers\Html;
use kartik\widgets\ActiveForm;
use kartik\widgets\ActiveField;
use kartik\widgets\SwitchInput;
use kartik\money\MaskMoney;
use yii\helpers\ArrayHelper;
use kartik\select2\Select2;
use app\models\Proveedores;

/* @var $this yii\web\View */
/* @var $model app\models\Clientes */
/* @var $form yii\widgets\ActiveForm */
?>


<?php $form = ActiveForm::begin([
    'id' => 'cliente-form',
    'enableAjaxValidation' => true,
    'enableClientScript' => true,
    'enableClientValidation' => true,
]); ?>


<fieldset>

   
     <?= $form->field($model, 'cedrif', [
      'addon' => ['prepend' => ['content'=>'<i class="fa fa-barcode"></i>']]
        ])->widget('yii\widgets\MaskedInput', [
        'mask' => 'A999999999'
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
  </div>

  



  
<div class="widget-toolbox padding-8 clearfix">
<div class="form-group">
    <?= Html::submitButton( ($model->isNewRecord) ? '<i class="ace-icon fa fa-floppy-o bigger-120 green "></i> Guardar' : '<i class="ace-icon fa fa-floppy-o bigger-120  "></i> Guardar' , ['class' => ($model->isNewRecord) ? 'btn btn-white btn-success btn-bold pull-right' : 'btn btn-white btn-primary btn-bold pull-right']  ) ?>
</div>
</div>
</fieldset>


<?php ActiveForm::end(); ?>



<?php
$this->registerJs('
    // obtener la id del formulario y establecer el manejador de eventos
        $("form#cliente-form").on("beforeSubmit", function(e) {
            var form = $(this);
            $.post(
                form.attr("action")+"&submit=true",
                form.serialize()
            )
            .done(function(result) {
              $("#modal-cliente").modal("hide");

            });
            return false;
        }).on("submit", function(e){
            e.preventDefault();
            e.stopImmediatePropagation();
            return false;
        });
    ');
?>
