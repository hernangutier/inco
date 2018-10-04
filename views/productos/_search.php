<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\ProductosSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="productos-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'ref') ?>

    <?= $form->field($model, 'descripcion') ?>

    <?= $form->field($model, 'und') ?>

    <?= $form->field($model, 'costo') ?>

    <?php // echo $form->field($model, 'percent_utilidad') ?>

    <?php // echo $form->field($model, 'pvp') ?>

    <?php // echo $form->field($model, 'is_public') ?>

    <?php // echo $form->field($model, 'id_marca') ?>

    <?php // echo $form->field($model, 'id_grupo') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
