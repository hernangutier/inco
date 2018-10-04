<?php
use cornernote\ace\web\AceAsset;
use yii\bootstrap\Nav;
use yii\helpers\Html;

/* @var $this \yii\web\View */
/* @var $content string */

!empty($viewPath) || $viewPath = '@vendor/cornernote/yii2-ace/src/views/layouts';
!empty($viewNavbar) || $viewNavbar = $viewPath . '/navbar';
!empty($viewSidebar) || $viewSidebar = $viewPath . '/sidebar';
!empty($viewFooter) || $viewFooter = $viewPath . '/footer';
!empty($viewContent) || $viewContent = $viewPath . '/_content';
!empty($viewContent) || $viewContent = $viewhead . '/head';

AceAsset::register($this);
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
              <?= $this->render($vieSidebar) ?>

            <div class="main-content">
                <div class="main-content-inner">
                    <?= $this->render('//layouts/breadcrumbs') ?>
                    <div class="page-content"><?= $content ?> </div>
                </div>
            </div>

              <?= $this->render($viewFooter) ?>
            <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
                <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
            </a>
        </div>
        <?php $this->endBody() ?>
    </body>
</html>
<?php $this->endPage() ?>
