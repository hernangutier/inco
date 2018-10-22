<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\NotasEntregaDetail */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="notas-entrega-detail-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'id_not')->textInput() ?>

    <?= $form->field($model, 'id_prod')->textInput() ?>

    <?= $form->field($model, 'cnt')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
