<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\InvDetail */

$this->title = 'Create Inv Detail';
$this->params['breadcrumbs'][] = ['label' => 'Inv Details', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="inv-detail-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
