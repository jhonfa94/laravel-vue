<template>
  <div>
    <!-- Main Sidebar Container -->
    <aside class="main-sidebar sidebar-dark-primary elevation-4">
      <!-- Brand Logo -->
      <a href="index3.html" class="brand-link">
        <img :src="ruta +'/img/AdminLTELogo.png'" class="brand-image img-circle elevation-3" style="opacity: .8" />
        <span class="brand-text font-weight-light">Laravel&Vue</span>
      </a>

      <!-- Sidebar -->
      <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
          <div class="image">
            <img :src="ruta +'/img/avatar5.png'" class="img-circle elevation-2" />
          </div>
          <div class="info">
            <a href="#" class="d-block">Jhon Fabio</a>
          </div>
        </div>

        <!-- Sidebar Menu -->
        <nav class="mt-2">
          <ul
            class="nav nav-pills nav-sidebar flex-column"
            data-widget="treeview"
            role="menu"
            data-accordion="false"
          >
            <!-- Add icons to the links using the .nav-icon class
            with font-awesome or any other icon font library-->
            <li class="nav-item has-treeview menu-open">
              <a href="#" class="nav-link active">
                <i class="nav-icon fas fa-tachometer-alt"></i>
                <p>
                  Dashboard
                  <i class="right fas fa-angle-left"></i>
                </p>
              </a>
              <ul class="nav nav-treeview">
                <li class="nav-item">
                  <a href="#" class="nav-link active">
                    <i class="fas fa-circle nav-icon"></i>
                    <p>Active Page</p>
                  </a>
                </li>
                <li class="nav-item">
                  <a href="#" class="nav-link">
                    <i class="fas fa-circle nav-icon"></i>
                    <p>Inactive Page</p>
                  </a>
                </li>
              </ul>
            </li>
            <li class="nav-item">
              <a href="#" class="nav-link">
                <i class="nav-icon fas fa-th"></i>
                <p>
                  Simple Link
                  <span class="right badge badge-danger">New</span>
                </p>
              </a>
            </li>

            <li class="nav-header">OPERACIONES</li>
            <li class="nav-item">
              <a href="pages/calendar.html" class="nav-link">
                <i class="nav-icon fas fa-cash-register"></i>
                <p>Pedidos</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="pages/calendar.html" class="nav-link">
                <i class="nav-icon fas fa-users"></i>
                <p>Clientes</p>
              </a>
            </li>

            <li class="nav-header">CONFIGURACIÓN</li>
            <li class="nav-item">
              <a href="pages/calendar.html" class="nav-link">
                <i class="nav-icon fas fa-sitemap"></i>
                <p>Categorías</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="pages/calendar.html" class="nav-link">
                <i class="nav-icon fas fa-apple-alt"></i>
                <p>Productos</p>
              </a>
            </li>

            <li class="nav-header">ADMINISTRACIÓN</li>
            <li class="nav-item">
              <a href="pages/calendar.html" class="nav-link">
                <i class="nav-icon fas fa-users"></i>
                <p>Usuarios</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="pages/calendar.html" class="nav-link">
                <i class="nav-icon fas fa-unlock-alt"></i>
                <p>Roles</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="pages/calendar.html" class="nav-link">
                <i class="nav-icon fas fa-key"></i>
                <p>Permisos</p>
              </a>
            </li>

            <li class="nav-header">REPORTES</li>
            <li class="nav-item">
              <a href="pages/calendar.html" class="nav-link">
                <i class="nav-icon fas fa-file-pdf"></i>
                <p>Pedidos</p>
              </a>
            </li>
           




          </ul>
        </nav>
        <!-- /.sidebar-menu -->
      </div>
      <!-- /.sidebar -->
    </aside>
  </div>
</template>

<script>
export default {
  props:['ruta']
};
</script>

<style>
</style>