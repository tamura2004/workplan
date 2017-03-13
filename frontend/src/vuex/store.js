import Vuex from 'vuex'
import Vue from 'vue'
import works from './modules/works'
import assigns from './modules/assigns'
import createLogger from 'vuex/dist/logger'

import { get, load } from '@/lib/http'

Vue.use(Vuex)

import {
  SET_PROJECT,
  LOAD_USERS,
  LOAD_RANKS,
  LOAD_MONTHS,
  LOAD_PROJECTS
} from './mutation-types'

const state = {
  project: null,
  ranks: [],
  users: [],
  months: [],
  projects: []
}

const getters = {
  project: state => state.project,
  projects: state => state.projects,
  ranks: state => state.ranks,
  users: state => state.users,
  months: state => state.months.filter(m => m.id < 12)
}

const actions = {
  [LOAD_USERS]: get(LOAD_USERS),
  [LOAD_RANKS]: get(LOAD_RANKS),
  [LOAD_MONTHS]: get(LOAD_MONTHS),
  [LOAD_PROJECTS]: get(LOAD_PROJECTS)
}

const mutations = {
  [SET_PROJECT] (state, project) {
    state.project = project
  },
  [LOAD_USERS]: load(LOAD_USERS),
  [LOAD_RANKS]: load(LOAD_RANKS),
  [LOAD_PROJECTS]: load(LOAD_PROJECTS),
  [LOAD_MONTHS] (state, data) {
    for (let month of data) {
      month.date = new Date(month.date)
      state.months.push(month)
    }
  }
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
