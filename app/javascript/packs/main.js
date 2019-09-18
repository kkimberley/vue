import Vue from 'vue/dist/vue.esm'
import Users from '../users.vue'
import Edit from '../edit.vue'
import New from '../new.vue'
import VueResource from 'vue-resource'
Vue.use(VueResource);

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '[data-behavior="app"]',
    components: { Users, Edit, New }
  })
})