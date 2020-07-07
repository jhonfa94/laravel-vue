<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="es">

  <!-- ===================== 
    INCLUIMOS EL HEAD 
  ========================= --> 
  @include('sections.head')

<body class="hold-transition sidebar-mini">
<div class="wrapper" id="app">

    <!-- ===================== 
      EJEMPLO COMPONENTE DE VUE 
    ========================= --> 
    <App ruta="{{route('basepath')}}"></App>

 

  
</div>
<!-- ./wrapper -->

<!-- REQUIRED SCRIPTS -->
@include('sections.script')

</body>
</html>
