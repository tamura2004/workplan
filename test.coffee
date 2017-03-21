axios = require "axios"

# axios.patch 'http://localhost:3000/api/assigns/users/12.json',
#   user:
#     assigns_attributes: [
#       id: 1320
#       month_id: 23
#       order_id: 9
#       power: 99
#     ,
#       month_id: 1837
#       _destroy: true
#     ]
# .then (r) =>
#   console.log(JSON.stringify(r.data, null, "\t"))
#   axios.get 'http://localhost:3000/api/assigns/users/12.json'
#     .then (r) => console.log(JSON.stringify(r.data, null, "\t"))
#     .catch (e) => console.log(e)

# .catch (e) => console.log(e)

axios.get 'http://localhost:3000/api/assigns/users/1.json'
  .then (r) => console.log(JSON.stringify(r.data, null, "\t"))
  .catch (e) => console.log(e)
