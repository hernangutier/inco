<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\NotasEntrega */

$this->title = 'Create Notas Entrega';
$this->params['breadcrumbs'][] = ['label' => 'Notas Entregas', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="notas-entrega-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
