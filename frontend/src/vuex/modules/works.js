import {
  LOAD_WORKS,
  CHANGE_WORK,
  CREATE_WORK,
  UPDATE_WORK,
  DELETE_WORK
} from '../mutation-types'

import { get } from '@/lib/http'
import axios from 'axios'

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
  workPowerTotalByMonth: (state, getters) => month => {
    return getters.workByMonth(month).reduce(_total, 0)
  },
  workByUser: (state, getters) => user => {
    return getters.works.filter(w => {
      return w.user_id === user.id
    })
  },
  workPowerTotalByUser: (state, getters) => user => {
    return getters.workByUser(user).reduce(_total, 0)
  },
  workPowerTotal: (state, getters) => {
    return getters.works.reduce(_total, 0)
  }
}

// actions
const actions = {
  [LOAD_WORKS]: get(LOAD_WORKS),
  [CHANGE_WORK] ({commit, getters, dispatch}, [user, month, power]) {
    const work = getters.work(user, month)

    if (typeof power === 'number' && power > 0) {
      if (work == null) {
        dispatch(CREATE_WORK, [user, month, power])
      } else {
        dispatch(UPDATE_WORK, [work, power])
      }
    } else {
      if (work == null) {
        // nothing to do
      } else {
        dispatch(DELETE_WORK, work)
      }
    }
  },
  [CREATE_WORK] ({commit}, [user, month, power]) {
    axios.post('/api/works.json', {
      work: {
        user_id: user.id,
        month_id: month.id,
        power: power
      }
    })
    .then(r => commit(CREATE_WORK, r.data))
    .catch(e => console.log(e))
  },
  [UPDATE_WORK] ({commit}, [work, power]) {
    const params = {
      work: Object.assign({}, work, {power: power})
    }
    axios.patch(`/api/works/${work.id}.json`, params)
    .then(r => commit(UPDATE_WORK, [work, power]))
    .catch(e => console.log(e))
  },
  [DELETE_WORK] ({commit}, work) {
    axios.delete(`/api/works/${work.id}.json`)
    .then(r => commit(DELETE_WORK, work))
    .catch(e => console.log(e))
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
  [CREATE_WORK] (state, work) {
    state.works.push(work)
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
