<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use kartik\editable\Editable;
use yii\helpers\ArrayHelper;
use yii\helpers\Url;
/* @var $this yii\web\View */
/* @var $model frontend\models\Comisiones */

?>


<table style="table-layout: fixed;" width="100%" cellspacing="0" cellpadding="0" border="0">
  <tbody>
    <tr><td style="font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px; font-weight: normal; padding: 19px; border: 1px solid #e3e3e3; background-color: #f5f5f5;" width="100%" valign="top" bgcolor="#f5f5f5" align="left">
<table class="header-row" style="table-layout: fixed;" width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody>
  <tr><td class="header-row-td" style="font-family: Arial, sans-serif; font-weight: normal; line-height: 19px; color: #478fca; margin: 0px; font-size: 18px; padding-bottom: 8px; padding-top: 0px;" width="100%" valign="top" align="left">Datos del Cálculo</td></tr></tbody></table>


<table class="table-space" style="height: 10px; font-size: 0px; line-height: 0; width: 100px; background-color: transparent;" width="100" cellspacing="0" cellpadding="0" height="10" border="0" bgcolor="transparent"><tbody><tr><td class="table-space-td" style="height: 10px; width: 100px; background-color: transparent;" width="100" valign="middle" height="10" bgcolor="transparent" align="left">&nbsp;</td></tr></tbody></table>


<div class="row">
  <div class="col-sm-6">
    <?= '<label>N° de Control</label><br>' ?>
    <a href="#" style="color: #428bca; text-decoration: none; background-color: transparent;"><?= $model->ref  ?></a>
  </div>
  <div class="col-sm-6">
    <?= '<label>Datos del Chofer</label><br>' ?>
    <a href="#" style="color: #428bca; text-decoration: none; background-color: transparent;"><?= $model->chof->cedrif . ' ' . $model->chof->nombres  ?></a>
  </div>
</div>



<hr data-skipstyle="true" style="border-width: 0px; height: 1px; background-color: #e8e8e8;">
<div class="row">

  <div class="col-sm-6">
    <?= '<label>Fecha de Inicio</label><br>' ?>
    <a href="#" style="color: #428bca; text-decoration: none; background-color: transparent;"><?= $model->date_ini  ?></a>
  </div>

  <div class="col-sm--6">
    <?= '<label>Fecha de Corte</label><br>' ?>
    <a href="#" style="color: #428bca; text-decoration: none; background-color: transparent;"><?= $model->date_fin  ?></a>
  </div>

</div>

<hr data-skipstyle="true" style="border-width: 0px; height: 1px; background-color: #e8e8e8;">
<div class="row">
  <div class="col-sm-6">


    <?= '<label>Descripción</label><br>' ?>
    <a href="#" style="color: #428bca; text-decoration: none; background-color: transparent;"><?= $model->descripcion  ?></a>

</div>




</div>




<hr data-skipstyle="true" style="border-width: 0px; height: 1px; background-color: #e8e8e8;">











</td></tr></tbody></table>
