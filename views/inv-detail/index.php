<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\InvDetailSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Inv Details';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="inv-detail-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Inv Detail', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'id_master',
            'id_prod',
            'cnt',
            'observacion',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
