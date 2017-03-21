<template lang="pug">
#app
  .container
    nav.navbar.navbar-default
      .navbar-header
        .navbar-brand 要員別アサイン
      ul.nav.navbar-nav
        li.dropdown
          a.dropdown-toggle(href="#", data-toggle="dropdown", role="button", aria-haspopup="true", aria-expanded="false")
            | {{ user.number }} {{ user.name }} {{ user.rank_name }}
            span.caret
          ul.dropdown-menu
            li(v-for="user in user.users")
              a(:href="user.id") {{ user.number }} {{ user.name }} {{ user.rank_name }}

      ul.nav.navbar-nav
        li.dropdown
          a.dropdown-toggle(href="#", data-toggle="dropdown", role="button", aria-haspopup="true", aria-expanded="false") 案件追加
            span.caret
          ul.dropdown-menu
            li(v-for="order in user.all_orders")
              a(@click.prevent="addOrder(order)") {{ order.project_name }} {{ order.group_name }} {{ order.system_name }}

      form.navbar-form.navbar-right
        button.btn.btn-primary(@click="save") 保存


    table.table.table-bordered
      thead
        tr
          th 案件
          th グループ
          th システム
          th(v-for="month in user.months") {{ month.name }}
      tbody
        tr(v-for="order in user.orders")
          td {{ order.project_name }}
          td {{ order.group_name }}
          td {{ order.system_name }}
          td(v-for="assign in order.assigns")
            .form-group
              input.form-control(v-model="assign.power", type="text")


</template>

<script>
import axios from "axios"

export default {
  name: 'assignsUser',
  data: function () {
    return {
      user: {
        number: '',
        name: '',
        rank_name: '',
        months: [],
        users: [],
        orders: []
      }
    }
  },
  computed: {
    params () {
      let assigns = []
      for (let order of this.user.orders) {
        for (let assign of order.assigns) {
          if (assign.id === null) {
            if (assign.power !== null) {
              assigns.push(assign)
            }
          } else {
            if (assign.power !== assign.prev) {
              if (assign.power !== 0) {
                delete assign.prev
                assigns.push(assign)
              } else {
                assign._destroy = true
                assign.push(assign)
              }
            }
          }
        }
      }
      return {
        user: {
          assigns_attributes: assigns
        }
      }
    }
  },
  methods: {
    addOrder (order) {
      let assigns = []
      for (let month of this.user.months) {
        assigns.push({
          "id": null,
          "order_id": order.id,
          "user_id": this.user.id,
          "month_id": month.id,
          "power": null
        })
      }
      this.user.orders.push({
        "id": order.id,
        "project_id": order.project_id,
        "group_id": order.group_id,
        "system_id": order.system_id,
        "project_name": order.project_name,
        "group_name": order.group_name,
        "system_name": order.system_name,
        "assigns": assigns
      })
    },
    save () {
      axios.patch(`${window.location.pathname}.json`, this.params)
      .then(r => {
        this.user = r.data.user
      })
      .catch(e => console.log(e))
    }
  },
  created () {
    axios.get(`${window.location.pathname}.json`)
    .then(r => {
      this.user = r.data.user
    })
    .catch(e => console.log(e))
  }
}

</script>

<style lang="stylus" scoped>
p
  margin 0

th:nth-child(1)
  width 15%

th:nth-child(2)
  width 15%

th:nth-child(3)
  width 15%

h3
  margin-top 0

.navbar-right
  button
    margin-rignt 24px

</style>
