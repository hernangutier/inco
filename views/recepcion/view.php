<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use kartik\dialog\Dialog;
use yii\bootstrap\Modal;
use app\models\Productos;
use kartik\widgets\ActiveForm;
/* @var $this yii\web\View */
/* @var $model app\models\Recepciones */
/* @var $searchModel app\models\RecepcionesDetailSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */


$this->title ='Recepcionar Mercancia';
$this->params['breadcrumbs'][] = ['label' => 'Recepciones', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>


<?php
    $this->registerJs("
           $(document).on('click', '#activity-index-link', (function() {
        $('.tl').text('Nuevo Producto');
        $.get(

            $(this).data('url'),
            function (data) {
                $('.modal-body').html(data);
                $('#modal-productos').modal();
            }
        );
    }));
    ");
?>




<?php



$this->registerJs("

$(document).ready(function() {
  window.history.pushState(null, '', window.location.href);
  window.onpopstate = function() {
     window.history.pushState(null, '', window.location.href);
   }
 })

$(document).on('click','.add',function (){

  $('.tl').text('Agregar Documento');
  $.get(

      $(this).data('url'),
      function (data) {
          $('.modal-body').html(data);
          $('#modal-documentos').modal();
      }
  );


  });

  $(document).on('click','.update',function (){

    $('.tl').text('Actualizar Documento');
    $.get(

        $(this).data('url'),
        function (data) {
            $('.modal-body').html(data);
            $('#modal-documentos').modal();
        }
    );


    });





");
?>

<?php
Modal::begin([
    'id' => 'modal-productos',
    'options'=>[
      'tabindex'=>false,
    ],
    'header' => '<h4 class="blue bigger tl">Nuevo Articulo</h4>',

]);

echo "<div class='well'></div>";

Modal::end();
?>

<div class="row">
  <div class="col-sm-4">
    <?= Yii::$app->controller->renderPartial('_left',['model'=>$model]); ?>
  </div>
 <hr>
  <div class="col-sm-8">
      <?= Yii::$app->controller->renderPartial('_center',['searchModel'=>$searchModel,'dataProvider'=>$dataProvider]); ?>
  </div>
  </div>
