import * as types from '../mutation-types'

// initial state
const state = {
  all: []
}

// getters
const getters = {
  works: state => state.all,
  work: (state, getters) => (user, month) => {
    return getters.works.find((work) =>
      work.user_id === user.id && work.month_id === month.id
    )
  },
  workPower: (state, getters) => (user, month) => {
    const work = getters.work(user, month)
    return work == null ? '' : work.power
  },
  powerTotalByMonth: (state, getters) => month => {
    let power = 0
    for (const work of getters.works) {
      if (work.month_id === month.id) {
        power += work.power
      }
    }
    return power
  },
  powerTotalByUser: (state, getters) => user => {
    let power = 0
    for (const work of getters.works) {
      if (work.user_id === user.id) {
        power += work.power
      }
    }
    return power
  },
  powerTotal: (state, getters) => {
    let power = 0
    for (const work of getters.works) {
      power += work.power
    }
    return power
  }
}

// actions
const actions = {
  [types.CHANGE_WORK] ({commit, getters}, [user, month, power]) {
    const work = getters.work(user, month)
    if (work == null) {
      commit(types.CREATE_WORK, [user, month, power])
    } else if (typeof power === 'string' || power === 0) {
      commit(types.DELETE_WORK, work)
    } else {
      commit(types.UPDATE_WORK, [work, power])
    }
  }
}

// mutations
const mutations = {
  [types.UPDATE_WORK] (state, [work, power]) {
    work.power = power
  },
  [types.CREATE_WORK] (state, [user, month, power]) {
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
  [types.DELETE_WORK] (state, work) {
    state.works.splice(work.id, 1)
  }
}

export default {
  state,
  getters,
  actions,
  mutations
}
