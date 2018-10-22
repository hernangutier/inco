<?php
    use yii\helpers\Url;
    use yii\helpers\Html;
 ?>





<div id="sidebar" class="sidebar responsive" >
    <div class="sidebar-shortcuts" id="sidebar-shortcuts">
        <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">



            <button class="btn btn-success" >
                <i class="ace-icon fa 	fa-exchange "></i>
            </button>
            <button class="btn btn-info">
                <i class="ace-icon fa fa-pencil"></i>
            </button>
            <button class="btn btn-warning">
                <i class="ace-icon fa fa-users"></i>
            </button>
            <button class="btn btn-danger">
                <i class="ace-icon fa fa-cogs"></i>
            </button>
        </div>
        <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
            <span class="btn btn-success"></span>
            <span class="btn btn-info"></span>
            <span class="btn btn-warning"></span>
            <span class="btn btn-danger"></span>
        </div>
    </div>

    <ul class="nav nav-list">

        <li class="active">
            <a href="<?= Url::toRoute(['site/index']) ?>">
                <i class="menu-icon fa fa-home"></i>
                <span class="menu-text"> Inicio </span>
            </a>

            <b class="arrow"></b>
        </li>

        <li class="">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-tag "></i>
							<span class="menu-text">
							   Referencias
							</span>

							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>

						<ul class="submenu">








              <li class="">
										<a href="<?= Url::to(['proveedores/index'])  ?>">
											<i class="menu-icon fa fa-caret-right"></i>
											Proveedores
										</a>

										<b class="arrow"></b>
							</li>

              <li class="">
										<a href="<?= Url::to(['clientes/index'])  ?>">
											<i class="menu-icon fa fa-caret-right"></i>
											Clientes
										</a>

										<b class="arrow"></b>
							</li>

              <li class="">
                    <a href="<?= Url::to(['grupos/index'])  ?>">
                      <i class="menu-icon fa fa-caret-right"></i>
                      Grupos de Inventario
                    </a>

                    <b class="arrow"></b>
              </li>

              <li class="">
                    <a href="<?= Url::to(['marcas/index'])  ?>">
                      <i class="menu-icon fa fa-caret-right"></i>
                      Marcas
                    </a>

                    <b class="arrow"></b>
              </li>

              <li class="">
                    <a href="<?= Url::to(['productos/index'])  ?>">
                      <i class="menu-icon fa fa-caret-right"></i>
                      Productos
                    </a>

                    <b class="arrow"></b>
              </li>

              <li class="">
                    <a href="<?= Url::to(['zonas/index'])  ?>">
                      <i class="menu-icon fa fa-caret-right"></i>
                      Zonas
                    </a>

                    <b class="arrow"></b>
              </li>

              <li class="">
                    <a href="<?= Url::to(['zonas/index'])  ?>">
                      <i class="menu-icon fa fa-caret-right"></i>
                      Marcas
                    </a>

                    <b class="arrow"></b>
              </li>





          </li>
  </ul>


  </ul>

  <ul class="nav nav-list">

          <li class="">
              <a href="#" class="dropdown-toggle">
                <i class="menu-icon fa fa-reorder"></i>
                <span class="menu-text">
                   Transacciones
                </span>

                <b class="arrow fa fa-angle-down"></b>
              </a>

              <b class="arrow"></b>

              <ul class="submenu">

                <li class="">
                      <a href="<?= Url::to(['recepcion/create'])  ?>">
                        <i class="menu-icon fa fa-caret-right"></i>
                         Recepcionar Mercancia
                      </a>

                      <b class="arrow"></b>
                  </li>

                  <li class="">
                        <a href="<?= Url::to(['inv-master/create'])  ?>">
                          <i class="menu-icon fa fa-caret-right"></i>
                           Aperturar Inventario a Reportar
                        </a>

                        <b class="arrow"></b>
                    </li>





                  <li class="">
                          <a href="<?= Url::to(['notas-entrega/create'])  ?>">
                            <i class="menu-icon fa fa-caret-right"></i>
                            Despacho con Nota de Entrega
                          </a>

                          <b class="arrow"></b>
                  </li>

                  <li class="">
                          <a href="<?= Url::to(['movimientos-dt/index'])  ?>">
                            <i class="menu-icon fa fa-caret-right"></i>
                            Relacion de Mov. del Periodo
                          </a>

                          <b class="arrow"></b>
                  </li>

                  <li class="">
                    <a href="#" class="dropdown-toggle">
                        <i class="menu-icon fa fa-caret-right"></i>
                      <span class="menu-text">
                         Ordenes de Salida
                      </span>

                      <b class="arrow fa fa-angle-down"></b>
                    </a>

                    <b class="arrow"></b>

                    <ul class="submenu">

                      <li class="">
                            <a href="<?=  Url::to(['sa-ordenes-salida/create'])  ?>">
                              <i class="menu-icon fa fa-caret-right"></i>
                            Registrar Orden de Salida (Bienes Muebles)
                            </a>

                            <b class="arrow"></b>
                      </li>

                      <li class="">
                            <a href="<?=  Url::to(['inc-ordenes-compras/create'])  ?>">
                              <i class="menu-icon fa fa-caret-right"></i>
                            Registrar Orden de Salida (Vehiculos)
                            </a>

                            <b class="arrow"></b>
                      </li>

                      <li class="">
                            <a href="<?=  Url::to(['sa-ordenes-salida/index'])  ?>">
                              <i class="menu-icon fa fa-caret-right"></i>
                            Historico de Ordenes...
                            </a>

                            <b class="arrow"></b>
                          </li>



                      </ul>
                  </li>


              </ul>

   </li>












    <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
        <i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
    </div>


</ul>
</ul>

</div>
