<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use kartik\dialog\Dialog;
use yii\bootstrap\Modal;


/* @var $this yii\web\View */
/* @var $model frontend\models\Recepcion */

$this->title ='Recepcionar Mercancia';
$this->params['breadcrumbs'][] = ['label' => 'Recepciones', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
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
    'id' => 'modal-documentos',
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

    <div class="tabbable">
                  <ul class="nav nav-tabs" id="myTab">
                    <li class="active">
                      <a data-toggle="tab" href="#generales">
                        <i class="blue ace-icon fa fa-newspaper-o bigger-110"></i>
                        Documentos
                      </a>
                    </li>

                    <li >
                      <a data-toggle="tab" href="#componentes">
                        <i class="blue fa fa-address-book bigger-110"></i>
                        Opcion no Disponible
                      </a>
                    </li>





                  </ul>

                  <div class="tab-content">
                    <div id="generales" class="tab-pane fade in active">
                      <?php
                          'Hola ' //echo Yii::$app->controller->renderPartial('_documentos',['model'=>$model]);
                      ?>
                    </div>

                    <div id="componentes" class="tab-pane fade">
                      <div class="alert alert-info">
                     <button type="button" class="close" data-dismiss="alert">
                       <i class="ace-icon fa fa-times"></i>
                     </button>
                     <strong>Upps!</strong>
                     Opcion en desarrollo
                     <br>
                   </div>
                    </div>

                    <div id="poliza" class="tab-pane fade">
                      <div class="widget-body">
												<?php
                            echo 'Hola'//Yii::$app->controller->renderPartial('_poliza',['model'=>$model]);
                         ?>
											</div>
                    </div>

                    <div id="archivo" class="tab-pane fade">
                      <?php
                          echo "HOLA"; //echo Yii::$app->controller->renderPartial('_view_adicionales',['model'=>$model]);
                      ?>
                    </div>


                  </div>
        </div>

  </div>
</div>
