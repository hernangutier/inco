<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Choferes */

$this->title = 'Create Choferes';
$this->params['breadcrumbs'][] = ['label' => 'Choferes', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="choferes-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
