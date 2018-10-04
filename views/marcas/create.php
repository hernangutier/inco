<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Marcas */

$this->title = 'Create Marcas';
$this->params['breadcrumbs'][] = ['label' => 'Marcas', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="marcas-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
