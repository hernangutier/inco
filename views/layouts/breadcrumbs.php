<?php
    use yii\widgets\Breadcrumbs;
 ?>
<div class="breadcrumbs" id="breadcrumbs">
  <?php if (isset($this->params['breadcrumbs'])) { ?>
      <div class="breadcrumbs">
          <?= Breadcrumbs::widget([
              'links' => $this->params['breadcrumbs'],
          ]) ?>
      </div>
  <?php } ?>

    <div class="nav-search" id="nav-search">
        <form class="form-search">
            <span class="input-icon">
                <input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />
                <i class="ace-icon fa fa-search nav-search-icon"></i>
            </span>
        </form>
    </div>
</div>
