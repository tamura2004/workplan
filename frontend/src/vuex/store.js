import Vuex from 'vuex'
import Vue from 'vue'
Vue.use(Vuex)

import {
  CHANGE_WORK
} from './mutation-types'

import USERS from '@/assets/users'
import RANKS from '@/assets/ranks'

const state = {
  ranks: RANKS,
  users: USERS,
  works: []
}

const actions = {
  [CHANGE_WORK] ({commit}, keyword) {
  }
}

const getters = {
  ranks: state => state.ranks,
  users: state => state.users,
  works: state => state.works
}

const mutations = {
  [CHANGE_WORK] (state, keyword) {

  }
}

export default new Vuex.Store({
  state,
  getters,
  actions,
  mutations
})
