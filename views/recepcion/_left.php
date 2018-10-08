<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use kartik\editable\Editable;
use yii\helpers\ArrayHelper;
use yii\helpers\Url;
/* @var $this yii\web\View */
/* @var $model common\models\Recepciones */

?>


<?php
$url="";
$this->registerJs("
$(document).ready(function (){

  $(document).on('click','.procesar',function (){
    krajeeDialog.confirm('Esta seguro de Procesar  ', function (result) {
         if (result) {

           $.ajax({
               // En data puedes utilizar un objeto JSON, un array o un query string
               data: {'id' : '$model->id'},
               //Cambiar a type: POST si necesario
               type: 'GET',
               // Formato de datos que se espera en la respuesta
               dataType: 'json',
               // URL a la que se enviará la solicitud Ajax
               url: 'index.php?r=recepcion%2Fprocesar',
           })
            .done(function( data, textStatus, jqXHR ) {
              var url = 'index.php?r=recepcion%2Findex';
              $(location).attr('href', url);
            })
            .fail(function( jqXHR, textStatus, errorThrown ) {
                alert('fallo');
           });


        }
      });

    });


   });
  ");
?>


<table style="table-layout: fixed;" width="100%" cellspacing="0" cellpadding="0" border="0">
  <tbody>
    <tr><td style="font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px; font-weight: normal; padding: 19px; border: 1px solid #e3e3e3; background-color: #f5f5f5;" width="100%" valign="top" bgcolor="#f5f5f5" align="left">
<table class="header-row" style="table-layout: fixed;" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody>
  <tr><td class="header-row-td" style="font-family: Arial, sans-serif; font-weight: normal; line-height: 19px; color: #478fca; margin: 0px; font-size: 18px; padding-bottom: 8px; padding-top: 0px;" width="100%" valign="top" align="left">Informacion de la Transacción</td></tr></tbody></table>
<span style="font-family: Arial, sans-serif; line-height: 19px; color: #777777; font-size: 14px;">Recepcion de Mercancia </span>

<table class="table-space" style="height: 10px; font-size: 0px; line-height: 0; width: 100px; background-color: transparent;" width="100" cellspacing="0" cellpadding="0" height="10" border="0" bgcolor="transparent"><tbody><tr><td class="table-space-td" style="height: 10px; width: 100px; background-color: transparent;" width="100" valign="middle" height="10" bgcolor="transparent" align="left">&nbsp;</td></tr></tbody></table>
<?= '<label>N° de Control</label><br>' ?>
<a href="#" style="color: #428bca; text-decoration: none; background-color: transparent;"><?= $model->getNControlFormat()  ?></a>
<hr data-skipstyle="true" style="border-width: 0px; height: 1px; background-color: #e8e8e8;">
<?php
echo '<label>Proveedor</label><br>';
echo Editable::widget([
    'name'=>'Proveedor',
    'asPopover' => false,

    'inputType' => Editable::INPUT_TEXTAREA,
    'value' => $model->prov->razon,
    'header' => 'Motivo',
    'submitOnEnter' => false,
    'size'=>'lg',
    'options' => ['class'=>'form-control', 'rows'=>5, 'placeholder'=>'Enter notes...']
    ]);
?>
<hr data-skipstyle="true" style="border-width: 0px; height: 1px; background-color: #e8e8e8;">
<?= '<label>Creado el</label><br>' ?>
<a href="#" style="color: #428bca; text-decoration: none; background-color: transparent;"><?= $model->date_creation  ?></a>
<hr data-skipstyle="true" style="border-width: 0px; height: 1px; background-color: #e8e8e8;">
<?= '<label>Estatus</label><br>' ?>
<?= $model->getStatusHtml() ?>
<hr data-skipstyle="true" style="border-width: 0px; height: 1px; background-color: #e8e8e8;">
<?= '<label>Resgistrado por</label><br>' ?>
<a href="#" style="color: #428bca; text-decoration: none; background-color: transparent;">bienes@gmail.com</a>

<?php
    if ($model->status==0){
      echo '<div class="clearfix form-actions">
      										<div class="col-md-offset-3 col-md-9">
      											<button class="btn btn-info procesar" type="button" data-url='. Url::to(['save','id'=>$model->id]) .'>' .
      												'<i class="ace-icon fa fa-check bigger-110 "></i>
      												Procesar
      											</button>

      											&nbsp; &nbsp; &nbsp;

      										</div>
      									</div>';
    }

 ?>


</td></tr></tbody></table>
