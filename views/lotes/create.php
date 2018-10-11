<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Lotes */

$this->title = 'Create Lotes';
$this->params['breadcrumbs'][] = ['label' => 'Lotes', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="lotes-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
