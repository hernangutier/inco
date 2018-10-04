<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Recencion */

$this->title = Yii::t('app', 'Recepcion de Mercancia');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Historico'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="col-sm-offset-3 col-sm-6">
              <?= $this->render('_form', [
        					'model' => $model,
    					]) ?>


</div>
