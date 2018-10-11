<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\LotesSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Lotes';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="lotes-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Lotes', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'id_recep',
            'id_prod',
            'cnt_empaque',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
