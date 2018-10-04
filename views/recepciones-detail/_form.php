<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\RecepcionesDetail */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="recepciones-detail-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'id_prod')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'cnt_facturada')->textInput() ?>

    <?= $form->field($model, 'cnt_recibida')->textInput() ?>

    <?= $form->field($model, 'id_recep')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
