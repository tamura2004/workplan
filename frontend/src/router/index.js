import Vue from 'vue'
import Router from 'vue-router'
import Works from '@/pages/Works'
import WorksGraph from '@/pages/WorksGraph'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/works',
      name: 'Works',
      component: Works
    },
    {
      path: '/',
      name: 'WorksGraph',
      component: WorksGraph
    }
  ]
})
