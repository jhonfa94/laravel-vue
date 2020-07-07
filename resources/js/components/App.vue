<template>
  <div>
    <!-- Navbar -->
    <Navbar :ruta="ruta"></Navbar>

    <!-- Sidebar principal -->
    <Sidebar :ruta="ruta"></Sidebar>

    <!-- Content Wrapper. Contains page content -->
    <Content></Content>

    <!-- Control Sidebar -->
    <!-- <aside class="control-sidebar control-sidebar-dark">
      <div class="p-3">
        <h5>Title</h5>
        <p>Sidebar contentffffff</p>
      </div>
    </aside>-->
    <!-- /.control-sidebar -->

    <!-- Footer -->
    <Footer></Footer>
  </div>
  <!-- div vue -->
</template>

<script>
import Navbar from "./plantilla/Navbar";
import Sidebar from "./plantilla/Sidebar";
import Content from "./plantilla/Content";
import Footer from "./plantilla/Footer";
export default {
  props: ['ruta'],
  components: { Navbar, Sidebar, Content, Footer }
};
</script>