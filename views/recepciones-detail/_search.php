<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\RecepcionesDetailSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="recepciones-detail-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'id_prod') ?>

    <?= $form->field($model, 'cnt_facturada') ?>

    <?= $form->field($model, 'cnt_recibida') ?>

    <?= $form->field($model, 'id_recep') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
