import * as types from '../mutation-types'

// initial state
const state = {
  all: [
    { id: 0, user_id: 1, month_id: 0, power: 0.5 },
    { id: 1, user_id: 1, month_id: 1, power: 1.5 },
    { id: 2, user_id: 1, month_id: 2, power: 2.5 },
    { id: 3, user_id: 1, month_id: 3, power: 3.5 },
    { id: 4, user_id: 1, month_id: 4, power: 4.5 }
  ]
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
  workByMonth: (state, getters) => month => {
    return getters.works.filter(w => {
      return w.month_id === month.id
    })
  },
  powerTotalByMonth: (state, getters) => month => {
    return getters.workByMonth(month).reduce((total, w) => {
      return total + w.power
    }, 0)
  },
  workByUser: (state, getters) => user => {
    return getters.works.filter(w => {
      return w.user_id === user.id
    })
  },
  powerTotalByUser: (state, getters) => user => {
    return getters.workByUser(user).reduce((total, w) => {
      return total + w.power
    }, 0)
  },
  powerTotal: (state, getters) => {
    return getters.works.reduce((total, w) => {
      return total + w.power
    }, 0)
  }
}

// actions
const actions = {
  [types.CHANGE_WORK] ({commit, getters}, [user, month, power]) {
    const work = getters.work(user, month)

    if (typeof power === 'number') {
      if (work == null) {
        commit(types.CREATE_WORK, [user, month, power])
      } else {
        commit(types.UPDATE_WORK, [work, power])
      }
    } else {
      if (work == null) {
        // nothing to do
      } else {
        commit(types.DELETE_WORK, work)
      }
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
    for (const work of state.all) {
      if (id < work.id) {
        id = work.id
      }
    }
    id++
    state.all.push({
      id: id,
      user_id: user.id,
      month_id: month.id,
      power: power
    })
  },
  [types.DELETE_WORK] (state, work) {
    state.all.some((w, i) => {
      if (w.id === work.id) state.all.splice(i, 1)
    })
  }
}

export default {
  state,
  getters,
  actions,
  mutations
}
