<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\NotasEntrega */

$this->title = 'Update Notas Entrega: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Notas Entregas', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="notas-entrega-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
