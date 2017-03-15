import Vuex from 'vuex'
import Vue from 'vue'
import works from './modules/works'
import assigns from './modules/assigns'
import createLogger from 'vuex/dist/logger'

import { get, load } from '@/lib/http'

Vue.use(Vuex)

import {
  SET_PROJECT,
  SET_GROUP,
  SET_SYSTEM,
  SET_USER,
  LOAD_USERS,
  LOAD_RANKS,
  LOAD_MONTHS,
  LOAD_PROJECTS,
  LOAD_ORDERS
} from './mutation-types'

const state = {
  selecting: null,
  project: null,
  group: null,
  system: null,
  user: null,
  ranks: [],
  users: [],
  months: [],
  projects: []
}

const getters = {
  project: state => state.project,
  group: state => state.group,
  system: state => state.system,
  user: state => state.user,
  projects: state => state.projects,
  ranks: state => state.ranks,
  users: state => state.users,
  months: state => state.months.filter(m => m.id < 12),
  orders: state => state.orders
}

const actions = {
  [LOAD_USERS]: get(LOAD_USERS),
  [LOAD_RANKS]: get(LOAD_RANKS),
  [LOAD_MONTHS]: get(LOAD_MONTHS),
  [LOAD_PROJECTS]: get(LOAD_PROJECTS),
  [LOAD_ORDERS]: get(LOAD_ORDERS)
}

const mutations = {
  [SET_PROJECT] (state, project) { state.project = project },
  [SET_GROUP] (state, group) { state.group = group },
  [SET_SYSTEM] (state, system) { state.system = system },
  [SET_USER] (state, user) { state.user = user },
  [LOAD_USERS]: load(LOAD_USERS),
  [LOAD_RANKS]: load(LOAD_RANKS),
  [LOAD_PROJECTS]: load(LOAD_PROJECTS),
  [LOAD_MONTHS] (state, data) {
    for (let month of data) {
      month.date = new Date(month.date)
      state.months.push(month)
    }
  },
  [LOAD_ORDERS]: load(LOAD_ORDERS)
}

const debug = process.env.NODE_ENV !== 'production'

export default new Vuex.Store({
  state,
  getters,
  actions,
  mutations,
  modules: {
    works,
    assigns
  },
  strict: debug,
  plugins: debug ? [createLogger()] : []
})
