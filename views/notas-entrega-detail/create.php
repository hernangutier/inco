<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\NotasEntregaDetail */

$this->title = 'Create Notas Entrega Detail';
$this->params['breadcrumbs'][] = ['label' => 'Notas Entrega Details', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="notas-entrega-detail-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
