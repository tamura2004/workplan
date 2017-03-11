import Vuex from 'vuex'
import Vue from 'vue'
import works from './modules/works'
// import axios from 'axios'
import createLogger from 'vuex/dist/logger'

Vue.use(Vuex)

// axios.defaults.headers.post['Content-Type'] = 'application/json'
// axios.defaults.headers.put['Content-Type'] = 'application/json'

// const http = axios.create({
//   baseUrl: 'http://localhost:3000/'
// })

import USERS from '@/assets/users'
import RANKS from '@/assets/ranks'

const state = {
  ranks: RANKS,
  users: USERS,
  months: [
    { id: 0, name: '4月' },
    { id: 1, name: '5月' },
    { id: 2, name: '6月' },
    { id: 3, name: '7月' },
    { id: 4, name: '8月' },
    { id: 5, name: '9月' },
    { id: 6, name: '10月' },
    { id: 7, name: '11月' },
    { id: 8, name: '12月' },
    { id: 9, name: '1月' },
    { id: 10, name: '2月' },
    { id: 11, name: '3月' }
  ]
}

const getters = {
  ranks: state => state.ranks,
  users: state => state.users,
  months: state => state.months
}

const actions = {
}

const mutations = {
}

const debug = process.env.NODE_ENV !== 'production'

export default new Vuex.Store({
  state,
  getters,
  actions,
  mutations,
  modules: {
    works
  },
  strict: debug,
  plugins: debug ? [createLogger()] : []
})
