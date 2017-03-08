import Vue from 'vue'
import Router from 'vue-router'
import Works from '@/pages/Works'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Works',
      component: Works
    }
  ]
})
