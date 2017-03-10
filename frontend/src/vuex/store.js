import Vuex from 'vuex'
import Vue from 'vue'
Vue.use(Vuex)

import {
  CHANGE_WORK,
  CREATE_WORK,
  UPDATE_WORK,
  DELETE_WORK
} from './mutation-types'

import USERS from '@/assets/users'
import RANKS from '@/assets/ranks'

const state = {
  ranks: RANKS,
  users: USERS,
  works: [
    { id: 0, user_id: 0, month_id: 0, power: 0.5 },
    { id: 1, user_id: 0, month_id: 1, power: 1.5 },
    { id: 2, user_id: 0, month_id: 2, power: 2.5 },
    { id: 3, user_id: 0, month_id: 3, power: 3.5 },
    { id: 4, user_id: 0, month_id: 4, power: 4.5 }
  ],
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
  works: state => state.works,
  months: state => state.months,
  work: state => (user, month) => {
    // month = month.format('YYYY-MM')
    return state.works.find((work) =>
      work.user_id === user.id && work.month_id === month.id
    )
  },
  workPower: (state, getters) => (user, month) => {
    const work = getters.work(user, month)
    return work == null ? '' : work.power
  },
  powerTotalByMonth: state => month => {
    let power = 0
    for (const work of state.works) {
      if (work.month_id === month.id) {
        power += work.power
      }
    }
    return power
  },
  powerTotalByUser: state => user => {
    let power = 0
    for (const work of state.works) {
      if (work.user_id === user.id) {
        power += work.power
      }
    }
    return power
  },
  powerTotal: state => {
    let power = 0
    for (const work of state.works) {
      power += work.power
    }
    return power
  }
}

const actions = {
  [CHANGE_WORK] ({commit, getters}, [user, month, power]) {
    const work = getters.work(user, month)
    if (work == null) {
      commit(CREATE_WORK, [user, month, power])
    } else if (typeof power === 'string' || power === 0) {
      commit(DELETE_WORK, work)
    } else {
      commit(UPDATE_WORK, [work, power])
    }
  }
}

const mutations = {
  [UPDATE_WORK] (state, [work, power]) {
    work.power = power
  },
  [CREATE_WORK] (state, [user, month, power]) {
    let id = null
    for (const work of state.works) {
      if (id < work.id) {
        id = work.id
      }
    }
    id++
    state.works.push({
      id: id,
      user_id: user.id,
      month_id: month.id,
      power: power
    })
  },
  [DELETE_WORK] (state, work) {
    state.works.splice(work.id, 1)
  }
}

import createLogger from 'vuex/dist/logger'

export default new Vuex.Store({
  state,
  getters,
  actions,
  mutations,
  plugins: [createLogger({
    collapsed: false
  })],
  strict: true
})
