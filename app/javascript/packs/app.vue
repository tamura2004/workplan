<template lang="pug">
#app
  .container
    nav.navbar.navbar-default
      .navbar-header
        .navbar-brand {{ user.number }} {{ user.name }} {{ user.rank_name }}
      ul.nav.navbar-nav
        li.dropdown
          a.dropdown-toggle(href="#", data-toggle="dropdown", role="button", aria-haspopup="true", aria-expanded="false")
            | 並び順
            span.caret
          ul.dropdown-menu
            li: a(href="#") 案件番号順
            li: a(href="#") グループ順
            li: a(href="#") システム順
      form.navbar-form.navbar-right
        button.btn.btn-primary(@click="save") 保存


    table.table.table-bordered
      thead
        tr
          th 案件明細
          th(v-for="month in user.months") {{ month.name }}
      tbody
        tr(v-for="order in user.orders_attributes")
          td 
            p {{ order.project_name }}
            p {{ order.group_name }}
            p {{ order.system_name }}
          td(v-for="assign in order.assigns_attributes")
            .form-group
              input.form-control(v-model="assign.id", type="text")
    button.btn.btn-primary(@click="addProject") 案件追加


</template>

<script>
import axios from "axios"

export default {
  data: function () {
    return {
      user: {
        number: '',
        name: '',
        rank_name: '',
        orders_attributes: [
        ]
      }
    }
  },
  methods: {
    addProject () {
      this.user.orders_attributes.push({
        project_name: '100',
        group_name: '200',
        system_name: '300',
        assigns_attributes: [
          { power: 0 },
          { power: 0 },
          { power: 0 },
          { power: 0 },
          { power: 0 },
          { power: 0 },
          { power: 0 },
          { power: 0 },
          { power: 0 },
          { power: 0 },
          { power: 0 },
          { power: 0 }
        ]
      })
    },
    save () {
      axios.patch('assigns.json', {
        user: this.user
      })
      .then(r => {
        this.user = r.data.user
      })
      .catch(e => console.log(e))
    }
  },
  created () {
    axios.get('assigns.json', {
      params: {
        "year_id": 0
      }
    })
    .then(r => {
      this.user = r.data.user
      console.log(r.data.user)
      console.log(r.data.user.orders_attributes[0])
      console.log(r.data.user.orders_attributes[0].assigns_attributes[0])
    })
    .catch(e => console.log(e))
  }
}

</script>

<style lang="stylus" scoped>
p
  margin 0

th:nth-child(1)
  width 20%

h3
  margin-top 0

.navbar-right
  button
    margin-rignt 24px

</style>
