<?php

use yii\helpers\Html;
use yii\bootstrap\Modal;

/* @var $this yii\web\View */
/* @var $model app\models\Recepcion */

$this->title = Yii::t('app', 'Lotes de la Compra: ' . $model->nfact );
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Historico'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<?php
    $this->registerJs("
           $(document).on('click', '#activity-index-link', (function() {
        $('.tl').text('Nuevo Proveedor');
        $.get(

            $(this).data('url'),
            function (data) {
                $('.modal-body').html(data);
                $('#modal-proveedor').modal();
            }
        );
    }));
    ");
?>


<?php
Modal::begin([
    'id' => 'modal-proveedor',
    'header' => '<h4 class="blue bigger tl">Nuevo Articulo</h4>',

]);

echo "<div class='well'></div>";

Modal::end();
?>


              <div class="profile-user-info profile-user-info-striped">
                                                <div class="profile-info-row">
                                                    <div class="profile-info-name"> N° de Factura </div>

                                                    <div class="profile-info-value">
                                                        <span class="editable editable-click" id="username"> <?= $model->nfact ?> </span>
                                                    </div>
                                                </div>

                                                <div class="profile-info-row">
                                                    <div class="profile-info-name"> Proveedor </div>

                                                    <div class="profile-info-value">
                                                        <i class="fa fa-map-marker light-orange bigger-110"></i>
                                                        <span class="editable editable-click" id="country"><?= $model->prov->razon ?></span>
                                                        <span class="editable editable-click" id="city"><?= $model->prov->rif ?></span>
                                                    </div>
                                                </div>



