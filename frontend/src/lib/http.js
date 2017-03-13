import axios from 'axios'

axios.defaults.headers.post['Content-Type'] = 'application/json'
axios.defaults.headers.put['Content-Type'] = 'application/json'

const http = axios.create()

export function get (type) {
  const model = type.split('_')[1].toLowerCase()
  return ({commit}) => {
    // http.get(`http://localhost:3000/${model}.json`)
    http.get(`/api/${model}.json`)
    .then(r => commit(type, r.data))
    .catch(e => console.log(e))
  }
}

export function load (type) {
  const model = type.split('_')[1].toLowerCase()
  return (state, data) => {
    state[model] = data
  }
}
