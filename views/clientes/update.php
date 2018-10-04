<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\IncOrdenesCompras */

$this->title = 'Actualizar Cliente: ' . $model->cedrif;
$this->params['breadcrumbs'][] = ['label' => 'Clientes', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<?php
     $this->registerJs('
      $(document).ready(function() {
        window.history.pushState(null, "", window.location.href);
        window.onpopstate = function() {
           window.history.pushState(null, "", window.location.href);
         };
       })

     ');
 ?>
<div class="col-sm-offset-3 col-sm-6">
  <div class="widget-box widget-color-blue2">
                        <div class="widget-header">
                          <h4 class="widget-title">Actualizar Cliente </h4>
                        </div>

                        <div class="widget-body">
                          <div class="widget-main no-padding">

              <?= $this->render('_form', [
                  'model' => $model,
              ]) ?>

            </div>
            </div>
            </div>


</div>
