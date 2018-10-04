<?php

use cornernote\ace\web\AceAsset;
use yii\bootstrap\Nav;
use yii\helpers\Html;

/* @var $this \yii\web\View */
/* @var $content string */

AceAsset::register($this);
!empty($viewPath) || $viewPath = '@vendor/cornernote/yii2-ace/src/views/layouts';
!empty($viewNavbar) || $viewNavbar =  'navbar';
!empty($viewhead) || $viewhead =  'head';
!empty($viewbreak) || $viewbreak =  'breadcrumbs';
!empty($viewSidebar) || $viewSidebar =  'sidebar';
!empty($viewFooter) || $viewFooter =  'footer';
!empty($viewContent) || $viewContent =  '_content';


?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
    <head>
        <?= $this->render($viewhead) ?>
    </head>
    <body class="no-skin">
        <?php $this->beginBody() ?>



        <?= $this->render($viewNavbar) ?>

        <div class="main-container" id="main-container">

          <?= $this->render($viewSidebar) ?>

            <div class="main-content">
                <div class="main-content-inner">
                    <?= $this->render($viewbreak) ?>

                    <div class="page-content">

                       <div class="row">
                            <div class="col-xs-12">



                                <?= $content ?>


                            </div> <!-- /.col -->
                        </div> <!-- /.row -->

                      </div> <!-- /.page-content  -->
                    </div> <!-- /.content-inner -->
      </div> <!-- /.main-content -->
          <?= $this->render($viewFooter) ?>

  </div> <!-- /.main-container -->
    </body>
  <?php $this->endBody() ?>

</html>
<?php $this->endPage() ?>
