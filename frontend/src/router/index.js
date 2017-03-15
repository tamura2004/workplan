import Vue from 'vue'
import Router from 'vue-router'
import Works from '@/pages/Works'
import Assigns from '@/pages/Assigns'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Works',
      component: Works
    },
    {
      path: '/assigns',
      name: 'Assigns',
      component: Assigns
    }
  ]
})
