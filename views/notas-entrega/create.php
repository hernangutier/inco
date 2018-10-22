<?php

use yii\helpers\Html;
use yii\bootstrap\Modal;

/* @var $this yii\web\View */
/* @var $model app\models\NotasEntrega */

$this->title = Yii::t('app', 'Nuevo Despacho con Nota de Entrega');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Historico'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<?php
    $this->registerJs("
           $(document).on('click', '#activity-index-link', (function() {
        $('.tl').text('Nuevo Cliente');
        $.get(

            $(this).data('url'),
            function (data) {
                $('.modal-body').html(data);
                $('#modal-cliente').modal();
            }
        );
    }));
    ");
?>


<?php
Modal::begin([
    'id' => 'modal-cliente',
    'header' => '<h4 class="blue bigger tl">Nuevo Articulo</h4>',

]);

echo "<div class='well'></div>";

Modal::end();
?>

<div class="col-sm-offset-3 col-sm-6">
              <?= $this->render('_form', [
        					'model' => $model,
    					]) ?>


</div>
