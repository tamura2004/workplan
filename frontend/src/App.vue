<template lang="pug">
#app
  //- nav.navbar.navbar-toggleable-md.navbar-light.fixed-top.bg-faded
  nav.navbar.navbar-toggleable-md.navbar-inverse.fixed-top.bg-inverse
    button.navbar-toggler.navbar-toggler-right(
      type='button',
      data-toggle='collapse',
      data-target='#navbarsExampleDefault',
      aria-controls='navbarsExampleDefault',
      aria-expanded='false',
      aria-label='Toggle navigation'
    )
      span.navbar-toggler-icon
    a.navbar-brand(href='#') WorkPlan
    #navbarsExampleDefault.collapse.navbar-collapse
      ul.navbar-nav.mr-auto

        li.nav-item.dropdown
          a#dropdown01.nav-link.dropdown-toggle(href='#', data-toggle='dropdown', aria-haspopup='true', aria-expanded='false') マスター管理
          .dropdown-menu(aria-labelledby='dropdown01')
            a.dropdown-item(href='/api/depts') 部
            a.dropdown-item(href='/api/ranks') ランク
            a.dropdown-item(href='/api/groups') グループ
            a.dropdown-item(href='/api/users') 担当者
            a.dropdown-item(href='/api/systems') システム
            a.dropdown-item(href='/api/projects') プロジェクト
            a.dropdown-item(href='/api/orders') 発注情報

        li.nav-item.dropdown
          a#dropdown01.nav-link.dropdown-toggle(href='#', data-toggle='dropdown', aria-haspopup='true', aria-expanded='false') 月別入力
          .dropdown-menu(aria-labelledby='dropdown01')
            a.dropdown-item(href='/#/works') 要員計画
            a.dropdown-item(href='/#/costs') 開発計画
            a.dropdown-item(href='/#/assigns') アサイン

        li.nav-item.dropdown
          a#dropdown01.nav-link.dropdown-toggle(href='#', data-toggle='dropdown', aria-haspopup='true', aria-expanded='false') データ補正
          .dropdown-menu(aria-labelledby='dropdown01')
            a.dropdown-item(href='/api/works') 要員計画
            a.dropdown-item(href='/api/costs') 開発計画
            a.dropdown-item(href='/api/assigns') アサイン

      form.form-inline.my-2.my-lg-0
        input.form-control.mr-sm-2(type='text', placeholder='Search')
        button.btn.btn-outline-success.my-2.my-sm-0(type='submit') Search

  .container
    router-view

</template>

<script>
<<<<<<< HEAD
import { LOAD_USERS, LOAD_RANKS, LOAD_MONTHS, LOAD_PROJECTS, LOAD_ORDERS } from '@/vuex/mutation-types'
=======
import { mapGetters } from 'vuex'
import { LOAD_USERS, LOAD_RANKS, LOAD_MONTHS, LOAD_PROJECTS } from '@/vuex/mutation-types'
>>>>>>> 1845f92722211dd37f8fd9bfae3f1f259d83d1cf

export default {
  name: 'app',
  computed: mapGetters(['project', 'group', 'system', 'projects', 'groups', 'systems']),
  data () {
    return {
      select: {
        project: false,
        group: false,
        system: false
      }
    }
  },
  created () {
    this.$store.dispatch(LOAD_USERS)
    this.$store.dispatch(LOAD_RANKS)
    this.$store.dispatch(LOAD_MONTHS)
    this.$store.dispatch(LOAD_PROJECTS)
    this.$store.dispatch(LOAD_ORDERS)
  }
}
</script>

<style lang="stylus">
#app
  font-family "游ゴシック", YuGothic, "ヒラギノ角ゴ Pro", "Hiragino Kaku Gothic Pro", "メイリオ", "Meiryo", sans-serif
  -webkit-font-smoothing antialiased
  -moz-osx-font-smoothing grayscale
<<<<<<< HEAD
=======

#selectbox
  border solid 1px #666

li.nav-item:hover
  color lightgray
  background-color gray

ul.list-group
  font-size 80%
  
  li.list-group-item
    padding 4px 8px
>>>>>>> 1845f92722211dd37f8fd9bfae3f1f259d83d1cf

  
</style>
