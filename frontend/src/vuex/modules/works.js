import {
  LOAD_WORKS,
  CHANGE_WORK,
  CREATE_WORK,
  UPDATE_WORK,
  DELETE_WORK
} from '../mutation-types'

import { get } from '@/lib/http'

// initial state
const state = {
  works: []
}

function _total (total, w) {
  // return total.plus(new Decimal(w.power))
  return total + w.power
}

// getters
const getters = {
  works: state => state.works,
  work: (state, getters) => (user, month) => {
    return getters.works.find((work) =>
      work.user_id === user.id && work.month_id === month.id
    )
  },
  workPower: (state, getters) => (user, month) => {
    const work = getters.work(user, month)
    return work == null ? '' : work.power / 100
  },
  workByMonth: (state, getters) => month => {
    return getters.works.filter(w => {
      return w.month_id === month.id
    })
  },
  powerTotalByMonth: (state, getters) => month => {
    return getters.workByMonth(month).reduce(_total, 0)
  },
  workByUser: (state, getters) => user => {
    return getters.works.filter(w => {
      return w.user_id === user.id
    })
  },
  powerTotalByUser: (state, getters) => user => {
    return getters.workByUser(user).reduce(_total, 0)
  },
  powerTotal: (state, getters) => {
    return getters.works.reduce(_total, 0)
  }
}

// actions
const actions = {
  [LOAD_WORKS]: get(LOAD_WORKS),
  [CHANGE_WORK] ({commit, getters}, [user, month, power]) {
    const work = getters.work(user, month)

    if (typeof power === 'number') {
      if (work == null) {
        commit(CREATE_WORK, [user, month, power])
      } else {
        commit(UPDATE_WORK, [work, power])
      }
    } else {
      if (work == null) {
        // nothing to do
      } else {
        commit(DELETE_WORK, work)
      }
    }
  }
}

// mutations
const mutations = {
  [LOAD_WORKS] (state, data) {
    state.works = data
  },
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
    state.works.some((w, i) => {
      if (w.id === work.id) state.works.splice(i, 1)
    })
  }
}

export default {
  state,
  getters,
  actions,
  mutations
}
