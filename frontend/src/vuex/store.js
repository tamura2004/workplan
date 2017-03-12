import Vuex from 'vuex'
import Vue from 'vue'
import works from './modules/works'
import createLogger from 'vuex/dist/logger'

import { get, load } from '@/lib/http'

Vue.use(Vuex)

import {
  LOAD_USERS,
  LOAD_RANKS,
  LOAD_MONTHS
} from './mutation-types'

const state = {
  ranks: [],
  users: [],
  months: []
}

const getters = {
  ranks: state => state.ranks,
  users: state => state.users,
  months: state => state.months.filter(m => m.id < 12)
}

const actions = {
  [LOAD_USERS]: get(LOAD_USERS),
  [LOAD_RANKS]: get(LOAD_RANKS),
  [LOAD_MONTHS]: get(LOAD_MONTHS)
}

const mutations = {
  [LOAD_USERS]: load(LOAD_USERS),
  [LOAD_RANKS]: load(LOAD_RANKS),
  [LOAD_MONTHS]: load(LOAD_MONTHS)
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
