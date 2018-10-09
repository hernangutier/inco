<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;
/* @var $this yii\web\View */
/* @var $model app\models\Lineas */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="lineas-form">

    <?php $form = ActiveForm::begin(); ?>

     <?php //-------------- Cargo -------------

                              echo $form->field($model, 'id_dep')->widget(Select2::classname(), [

                                   'data' => ArrayHelper::map(app\models\Departamentos::find()->asArray()->all(),'id','descripcion'),
                                   'language' => 'es',
                                   'size' => Select2::SMALL,
                                   'options' => ['placeholder' => 'Seleccione el Departamento'],
                                   'pluginOptions' => [
                                   'allowClear' => true
                                   ],
                                 ]);

                           ?>


    <?= $form->field($model, 'ref')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'descripcion')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
