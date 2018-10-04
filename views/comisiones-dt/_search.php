<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\ComisionesDtSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="comisiones-dt-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'id_com') ?>

    <?= $form->field($model, 'nfact') ?>

    <?= $form->field($model, 'id_client') ?>

    <?= $form->field($model, 'base_i') ?>

    <?php // echo $form->field($model, 'date_fact') ?>

    <?php // echo $form->field($model, 'comision') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
