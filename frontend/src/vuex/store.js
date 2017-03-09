import Vuex from 'vuex'
import Vue from 'vue'
Vue.use(Vuex)

import {
  CHANGE_WORK,
  CREATE_WORK,
  UPDATE_WORK
} from './mutation-types'

import USERS from '@/assets/users'
import RANKS from '@/assets/ranks'

const state = {
  ranks: RANKS,
  users: USERS,
  works: [
    { id: 0, user_id: 0, month: '2017-07', power: 0.5 },
    { id: 1, user_id: 0, month: '2017-08', power: 1.5 },
    { id: 2, user_id: 0, month: '2017-09', power: 2.5 },
    { id: 3, user_id: 0, month: '2017-10', power: 3.5 },
    { id: 4, user_id: 0, month: '2017-11', power: 4.5 }
  ]
}

const actions = {
  [CHANGE_WORK] ({commit, state}, {userId, month, power}) {
    let ref = null
    for (const work of state.works) {
      if (work.user_id === userId && work.month === month) {
        ref = Object.assign({}, work)
      }
    }

    if (ref === null) {
      commit(CREATE_WORK, {
        user_id: userId,
        month: month,
        power: power
      })
    } else {
      commit(UPDATE_WORK, {
        id: ref.id,
        power: power
      })
    }
  }
}

const getters = {
  ranks: state => state.ranks,
  users: state => state.users,
  works: state => state.works,
  workByUserMonth: state => (userId, month) => {
    let ref = null

    for (const work of state.works) {
      if (work.user_id === userId && work.month === month) {
        ref = work.power
      }
    }

    if (ref === null) {
      ref = ''
    }

    return ref
  }
}

const mutations = {
  [UPDATE_WORK] (state, {id, power}) {
    console.log('update')
    let ref = null
    for (let work of state.works) {
      if (work.id === id) {
        ref = work
        work.power = power
      }
    }
    if (ref) {
      console.log('error', id, power)
    }
  },
  [CREATE_WORK] (state, {user_id, month, power}) {
    console.log('create')
    const id = Math.max(state.works.map((work) => work.id)) + 1
    state.works.push({
      id: id,
      user_id: user_id,
      month: month,
      power: power
    })
  }
}

export default new Vuex.Store({
  state,
  getters,
  actions,
  mutations
})
