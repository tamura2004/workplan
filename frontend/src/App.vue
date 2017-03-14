<template lang="pug">
#app
  //- link(
  //-   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css",
  //-   rel="stylesheet",
  //-   integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ",
  //-   crossorigin="anonymous"
  //- )

  nav.navbar.navbar-toggleable-md.nabvar-inverse.bg-inverse.text-white
    ul.navbar-brand.mb-0 WorkPlan
    .collapse.navbar-collapse#navbarContent
      ul.navbar-nav.mr-auto
        li.nav-item.dropdown
          a.nav-link.dropdown-toggle#dropdown Link
          .dropdown-menu(area-labelledby="dropdown")
            a.dropdown-item(href="#") ItemA
            a.dropdown-item(href="#") ItemB
            a.dropdown-item(href="#") ItemC
            a.dropdown-item(href="#") ItemD
        li.nav-item.mr-2(@click="select.project = !select.project") {{ project || '案件選択' }}▼
        li.nav-item.mr-2 {{ group || 'グループ選択' }}▼
        li.nav-item.mr-2 {{ system || 'システム選択' }}▼

      ul.navbar-nav.ml-auto
        li.nav-item Search▼

  .container
    .rounded#selectbox(v-if="select.project")
      h2 案件を選択して下さい
      ul.list-group(v-for="project in projects",:key="id")
        li.list-group-item {{ project.number }} {{ project.name }}

    .row 
      router-view

    .row
      .col-2
        b-dropdown(text="マスター管理")
          a.dropdown-item(href='/api/depts') 部
          a.dropdown-item(href='/api/ranks') ランク
          a.dropdown-item(href='/api/groups') グループ
          a.dropdown-item(href='/api/users') 担当者
          a.dropdown-item(href='/api/systems') システム
          a.dropdown-item(href='/api/projects') プロジェクト

      .col-2
        b-dropdown(text="データ補正")
          a.dropdown-item(href='/api/works') 要員計画
          a.dropdown-item(href='/api/orders') 発注情報
          a.dropdown-item(href='/api/costs') 開発計画
          a.dropdown-item(href='/api/assigns') アサイン


</template>

<script>
import { mapGetters } from 'vuex'
import { LOAD_USERS, LOAD_RANKS, LOAD_MONTHS, LOAD_PROJECTS } from '@/vuex/mutation-types'

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
  }
}
</script>

<style lang="stylus">
#app
  font-family "游ゴシック", YuGothic, "ヒラギノ角ゴ Pro", "Hiragino Kaku Gothic Pro", "メイリオ", "Meiryo", sans-serif
  -webkit-font-smoothing antialiased
  -moz-osx-font-smoothing grayscale

#selectbox
  border solid 1px #666

li.nav-item:hover
  color lightgray
  background-color gray

ul.list-group
  font-size 80%
  
  li.list-group-item
    padding 4px 8px

  
</style>
