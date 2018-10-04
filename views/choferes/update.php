<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Choferes */

$this->title = 'Update Choferes: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Choferes', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="choferes-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
