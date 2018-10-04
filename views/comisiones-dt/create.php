<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\ComisionesDt */

$this->title = 'Create Comisiones Dt';
$this->params['breadcrumbs'][] = ['label' => 'Comisiones Dts', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>




    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>
