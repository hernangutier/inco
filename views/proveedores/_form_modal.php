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
/* @var $model app\models\Proveedores */
/* @var $form yii\widgets\ActiveForm */
?>


<?php $form = ActiveForm::begin([
    'id' => 'proveedor-form',
    'enableAjaxValidation' => true,
    'enableClientScript' => true,
    'enableClientValidation' => true,
]); ?>


<fieldset>

   
    <?= $form->field($model, 'rif')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'razon')->textInput(['maxlength' => true]) ?>

  



  
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
        $("form#proveedor-form").on("beforeSubmit", function(e) {
            var form = $(this);
            $.post(
                form.attr("action")+"&submit=true",
                form.serialize()
            )
            .done(function(result) {
              $("#modal-proveedor").modal("hide");

            });
            return false;
        }).on("submit", function(e){
            e.preventDefault();
            e.stopImmediatePropagation();
            return false;
        });
    ');
?>
