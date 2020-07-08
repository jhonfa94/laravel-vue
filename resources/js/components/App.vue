<template>
  <div>
    <!-- Navbar -->
    <Navbar :ruta="ruta"></Navbar>

    <!-- Sidebar principal -->
    <Sidebar :ruta="ruta"></Sidebar>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
      <transition name="slide-fade" mode="in-out">
        <router-view></router-view>
      </transition>
    </div>
    <!-- /.content-wrapper -->
    <!-- <Content></Content> -->

    <!-- Footer -->
    <Footer></Footer>
  </div>
  <!-- div vue -->
</template>

<script>
import Navbar from "./plantilla/Navbar";
import Sidebar from "./plantilla/Sidebar";
import Footer from "./plantilla/Footer";
export default {
  props: ["ruta"],
  components: { Navbar, Sidebar, Footer }
};
</script>