import Vue from "vue";
import Router from "vue-router";

Vue.use(Router);

export default new Router({
    routes: [
        { path: "/", component: require('./components/modulos/dashboard/index').default },
        { path: "/pedido", component: require('./components/modulos/pedido/index').default },
        { path: "/cliente", component: require('./components/modulos/cliente/index').default },
        { path: "/categoria", component: require('./components/modulos/categoria/index').default },
        { path: "/producto", component: require('./components/modulos/producto/index').default },
        { path: "/usuario", component: require('./components/modulos/usuario/index').default },
        { path: "/rol", component: require('./components/modulos/rol/index').default },
        { path: "/permiso", component: require('./components/modulos/permiso/index').default },
        { path: "/reporte", component: require('./components/modulos/reporte/index').default },
    
    ],
    mode:'history'
});
