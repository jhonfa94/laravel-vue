<template>
  <div>
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Usuario</h1>
          </div>
          <!-- /.col -->
          
        </div>
        <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
    </div>

    <div class="content container-fluid">
      <div class="car">
        <div class="card-header">
          <div class="card-tools">
            <router-link class="btn btn-info btn-sm" :to="'/'">
              <i class="fas fa-plus-square"></i> Nuevo usuario
            </router-link>
          </div>
        </div> <!-- card-header -->
        <div class="card-body">
          <div class="container-fluid">
            <div class="card card-info">
              <div class="card-header">
                <div class="card-title">Críterios de Búsqueda</div>
              </div>
              <div class="card-body">
                <form role="form">
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-med-3 col-form-label">Nombre</label>
                        <div class="col-md-6">
                          <input type="text" class="form-control" v-model="fillBusqUsuario.cNombre">
                        </div>
                      </div>
                    </div><!-- col -->

                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-med-3 col-form-label">Usuario</label>
                        <div class="col-md-6">
                          <input type="text" class="form-control" v-model="fillBusqUsuario.cUsuario">
                        </div>
                      </div>
                    </div><!-- col -->

                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-med-3 col-form-label">Correo Electrónico</label>
                        <div class="col-md-6">
                          <input type="email" class="form-control" v-model="fillBusqUsuario.cCorreo">
                        </div>
                      </div>
                    </div><!-- col -->

                    <div class="col-md-6">
                      <div class="form-group row">
                        <label class="col-med-3 col-form-label">Estado</label>
                        <div class="col-md-6">
                          <el-select class="w-100" v-model="fillBusqUsuario.cEstado" placeholder="Selleccione un Estado" clearable>
                            <el-option
                              v-for="item in listEstados"
                              :key="item.value"
                              :label="item.label"
                              :value="item.value">
                            </el-option>
                          </el-select>
                        </div>
                      </div>
                    </div><!-- col -->
                    
                  </div><!-- row -->
                </form><!-- from -->
              </div><!-- card-body -->

              <div class="card-footer">
                <div class="row">
                  <div class="col-md-4 offset-4">
                    <button class="btn btn-fat btn-info btnWidth" @click.prevent="getListUsuarios" > Buscar </button>
                    <button class="btn btn-fat btn-secondary btnWidth" @click.prevent="limpiarCriteriosBsq">Limpiar </button>
                  </div><!-- col -->


                </div><!-- row -->
              </div><!-- card-footer -->

            </div>

            <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title">Bandeja de Resultados</h3>
              </div>
              <div class="card-body table-responsive">
                <table class="table table-bordered table-hover table-head-fixed text-nowrap projects">
                  <thead>
                    <tr>
                      <th>Fotografía</th>
                      <th>Nombre</th>
                      <th>Correo</th>
                      <th>Usuario</th>
                      <th>Estado</th>
                      <th>Acciones</th>
                    </tr>
                  </thead>
                  <tbody>
                    <template v-if="listarUsuariosPaginated.length">
                      <tr v-for="(item, index) in listarUsuariosPaginated" :key="index">
                        <td>
                          <img src="/img/avatar.png" class="profile-avatar-img img-fluid img-circle" width="50" >
                        </td>
                        <td v-text="item.fullname"></td>
                        <td v-text="item.email"></td>
                        <td v-text="item.username"></td>
                        <td>
                          <template v-if="item.state == 'A'">
                            <span class="badge badge-success" v-text="item.state_alias"></span>                        
                          </template>
                          <template v-else>
                            <span class="badge badge-danger" v-text="item.state_alias"></span>                        
                          </template>
                        </td>
                        <td>
                          <router-link class="btn btn-primary btn-sm" :to="'/'">
                            <i class="fas fa-folder"></i> Ver
                          </router-link>
                          <router-link class="btn btn-info btn-sm" :to="'/'">
                            <i class="fas fa-pencil-alt"></i> Editar
                          </router-link>
                          <router-link class="btn btn-danger btn-sm" :to="'/'">
                            <i class="fas fa-trash"></i> Desactivar
                          </router-link>
                          <router-link class="btn btn-success btn-sm" :to="'/'">
                            <i class="fas fa-check"></i> Activar
                          </router-link>
                        </td>
                      </tr>                   
                    </template>
                    <template v-else>
                      <div class="callout callout-info">
                        <h5>No se encontraron registros</h5>
                      </div>
                    </template>
                  </tbody>

                </table>

                <div class="card-footer clearfix">
                  <ul class="pagination pagination sm m-0 float-right">
                    <li class="page-item" v-if="pageNumber > 0 ">
                      <a href="#" class="page-link" @click.prevent="prevPage">Ant</a>
                    </li>
                    <li class="page-item" v-for="(page,index) in pagesList" :key="index"
                      :class="[page == pageNumber ? 'active' : '']"
                    >
                      <a href="#" class="page-link" @click.prevent="selectPage(page)" v-text="page"></a>
                    </li>
                    <li class="page-item" v-if="pageNumber < pageCount - 1">
                      <a href="#" class="page-link" @click.prevent="nextPage">Post</a>
                    </li>
                  </ul>

                </div>

              </div>
            </div>

          </div><!-- container-fluid -->
        </div><!-- card-body -->
      </div>
    </div>


  </div>
  <!-- div-template -->
</template>

<script>
export default {
  data() {
    return {
      fillBusqUsuario: {
        cNombre : '',
        cUsuario : '',
        cCorreo : '',
        cEstado : '',
      },
      listUsuarios: [],
      listEstados: [
        {value : 'A', label: 'Activo'},
        {value : 'I', label: 'Inactivo'}
      ],
      pageNumber: 0,
      perPage: 5
      
    }
  },
  computed: {
    //Obtener el número de páginas
    pageCount(){
      let a = this.listUsuarios.length,
          b = this.perPage;
      
      return Math.ceil(a/b);
    },
    // Obtener los registros paginados
    listarUsuariosPaginated(){
      let inicio = this.pageNumber * this.perPage,
          fin = inicio + this.perPage;
      
      return this.listUsuarios.slice(inicio,fin);
    },
    // Obtener 
    pagesList(){

      let a = this.listUsuarios.length,
          b = this.perPage;
      
      let pageCount =  Math.ceil(a/b);
      let count = 0 , 
          pagesArray = []; 

      while(count < pageCount){
        pagesArray.push(count);
        count++;
      }

      return pagesArray;




    }

  },
  methods: {
    limpiarCriteriosBsq(){
      this.fillBusqUsuario.cNombre = '';
      this.fillBusqUsuario.cUsuario = '';
      this.fillBusqUsuario.cCorreo = '';
      this.fillBusqUsuario.cEstado = '';

    }, 
    limpiarBandejaUsuarios(){
      this.listUsuarios = [];
    },
    getListUsuarios(){
      let url = '/administracion/usuario/getListarUsuarios';
      axios.get(url,{
        params: {
          'cNombre' : this.fillBusqUsuario.cNombre,
          'cUsuario' : this.fillBusqUsuario.cUsuario,
          'cCorreo' : this.fillBusqUsuario.cCorreo,
          'cEstado' : this.fillBusqUsuario.cEstado,
        }
      }).then(response => {
        console.log(response.data);
        this.listUsuarios = response.data;
      })

    },
    nextPage(){
      this.pageNumber++;
    },
    prevPage(){
      this.perPage--;
    },
    selectPage(page){
      this.pageNumber = page;
    }
  }
};
</script>

<style>
</style>