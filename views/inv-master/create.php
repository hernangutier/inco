<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\InvMaster */

$this->title = 'Nuevo Inventario de Conteo';
$this->params['breadcrumbs'][] = ['label' => 'Inventarios Realizados', 'url' => ['index']];
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



              <?= $this->render('_form', [
        					'model' => $model,
    					]) ?>



</div>
