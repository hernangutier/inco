<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\RecepcionesDetailSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Recepciones Details';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="recepciones-detail-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Recepciones Detail', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'id_prod',
            'cnt_facturada',
            'cnt_recibida',
            'id_recep',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
