import Vue from 'vue'
import VueRouter from 'vue-router'
import Index from "../views/Index";
import Register from "../views/Register.vue";
import Login from "../views/Login.vue";
import MintContent  from '../views/MintContent.vue';
import Cart from '../views/Cart.vue';


Vue.use(VueRouter)

  const routes = [
  {
    path: '/',
    component: Index
  },
  {
    path: '/register',
    component:Register
  },
  {
    path:'/login',
    component:Login
  },
  {
    path:'/mintcontent',
    component:MintContent
  },
  {
    path:'/cart',
    component:Cart
  },
  {
    path: '/details/:lid',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "details" */ '../views/Details.vue'),
    props:true
  }
]

const router = new VueRouter({
  routes
})

export default router
