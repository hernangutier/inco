<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\ComisionesDtSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Comisiones Dts';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="comisiones-dt-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Comisiones Dt', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'id_com',
            'nfact',
            'id_client',
            'base_i',
            //'date_fact',
            //'comision',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
