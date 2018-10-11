<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Lotes */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="lotes-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'id_recep')->textInput() ?>

    <?= $form->field($model, 'id_prod')->textInput() ?>

    <?= $form->field($model, 'cnt_empaque')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
