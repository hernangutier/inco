<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\RecepcionesDetail */

$this->title = 'Create Recepciones Detail';
$this->params['breadcrumbs'][] = ['label' => 'Recepciones Details', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="recepciones-detail-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
