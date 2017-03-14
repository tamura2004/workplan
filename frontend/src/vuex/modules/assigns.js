// t.integer  "group_id"
// t.integer  "project_id"
// t.integer  "system_id"
// t.integer  "user_id"
// t.integer  "month_id"
// t.integer  "power"

import {
  LOAD_ASSIGNS,
  CHANGE_ASSIGN,
  CREATE_ASSIGN,
  UPDATE_ASSIGN,
  DELETE_ASSIGN
} from '../mutation-types'

import { get } from '@/lib/http'
import axios from 'axios'

// initial state
const state = {
  assigns: []
}

function _total (total, w) {
  return total + w.power
}

// getters
const getters = {
  assigns: (state, getters, rootState) => {
    let assigns = Object.assign({}, state.assigns)
    if (rootState.project !== null) {
      assigns = assigns.find(a => a.project_id === rootState.project.id)
    }
    if (rootState.group !== null) {
      assigns = assigns.find(a => a.group_id === rootState.group.id)
    }
    if (rootState.system !== null) {
      assigns = assigns.find(a => a.system_id === rootState.system.id)
    }
    return assigns
  },
  assign: (state, getters) => (user, month) => {
    return getters.assigns.find((assign) => {
      return assign.user_id === user.id && assign.month_id === month.id
    })
  },
  assignPower: (state, getters) => (user, month) => {
    const assign = getters.assign(user, month)
    return assign == null ? '' : assign.power / 100
  },
  assignByMonth: (state, getters) => month => {
    return getters.assigns.filter(w => {
      return w.month_id === month.id
    })
  },
  assignPowerTotalByMonth: (state, getters) => month => {
    return getters.assignByMonth(month).reduce(_total, 0)
  },
  assignByUser: (state, getters) => user => {
    return getters.assigns.filter(w => {
      return w.user_id === user.id
    })
  },
  assignPowerTotalByUser: (state, getters) => user => {
    return getters.assignByUser(user).reduce(_total, 0)
  },
  assignPowerTotal: (state, getters) => {
    return getters.assigns.reduce(_total, 0)
  }
}

// actions
const actions = {
  [LOAD_ASSIGNS]: get(LOAD_ASSIGNS),
  [CHANGE_ASSIGN] ({commit, getters, dispatch}, [user, month, power]) {
    const assign = getters.assign(user, month)

    if (typeof power === 'number' && power > 0) {
      if (assign == null) {
        dispatch(CREATE_ASSIGN, [user, month, power])
      } else {
        dispatch(UPDATE_ASSIGN, [assign, power])
      }
    } else {
      if (assign == null) {
        // nothing to do
      } else {
        dispatch(DELETE_ASSIGN, assign)
      }
    }
  },
  [CREATE_ASSIGN] ({commit}, [user, month, power]) {
    axios.post('/api/assigns.json', {
      assign: {
        user_id: user.id,
        month_id: month.id,
        power: power
      }
    })
    .then(r => commit(CREATE_ASSIGN, r.data))
    .catch(e => console.log(e))
  },
  [UPDATE_ASSIGN] ({commit}, [assign, power]) {
    const params = {
      assign: Object.assign({}, assign, {power: power})
    }
    axios.patch(`/api/assigns/${assign.id}.json`, params)
    .then(r => commit(UPDATE_ASSIGN, [assign, power]))
    .catch(e => console.log(e))
  },
  [DELETE_ASSIGN] ({commit}, assign) {
    axios.delete(`/api/assigns/${assign.id}.json`)
    .then(r => commit(DELETE_ASSIGN, assign))
    .catch(e => console.log(e))
  }
}

// mutations
const mutations = {
  [LOAD_ASSIGNS] (state, data) {
    state.assigns = data
  },
  [UPDATE_ASSIGN] (state, [assign, power]) {
    assign.power = power
  },
  [CREATE_ASSIGN] (state, assign) {
    state.assigns.push(assign)
  },
  [DELETE_ASSIGN] (state, assign) {
    state.assigns.some((w, i) => {
      if (w.id === assign.id) state.assigns.splice(i, 1)
    })
  }
}

export default {
  state,
  getters,
  actions,
  mutations
}
