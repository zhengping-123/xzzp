import Vue from 'vue'
import App from './App.vue'
import router from './router'
import axios from "axios"
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
Vue.use(ElementUI);                                                                                                                                                   
//在new Vue()之前就要引入页头组件，并让它变成全剧组建
import MyHeader from "./components/MyHeader"
Vue.component("my-header",MyHeader);
//在整个vue大家庭中就有了一个全局组件my-header，可在任意.vue文件中任意位置使用！

axios.defaults.baseURL='http://127.0.0.1:9999';
Vue.prototype.axios=axios;

Vue.config.productionTip = false

new Vue({
  router,
  render: h => h(App)
}).$mount('#app')
