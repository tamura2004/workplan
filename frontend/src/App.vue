<template lang="pug">
#app
  link(
    href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css",
    rel="stylesheet",
    integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ",
    crossorigin="anonymous"
  )

  .row
    .col-2
      b-dropdown(text="マスター管理")
        a.dropdown-item(href='/api/depts') 部
        a.dropdown-item(href='/api/ranks') ランク
        a.dropdown-item(href='/api/groups') グループ
        a.dropdown-item(href='/api/users') 担当者
        a.dropdown-item(href='/api/systems') システム
        a.dropdown-item(href='/api/projects') プロジェクト

      b-dropdown(text="データ補正")
        a.dropdown-item(href='/api/works') 要員計画
        a.dropdown-item(href='/api/orders') 発注情報
        a.dropdown-item(href='/api/costs') 開発計画
        a.dropdown-item(href='/api/assigns') アサイン

    .col-10
      router-view

</template>

<script>
import { LOAD_USERS, LOAD_RANKS, LOAD_MONTHS } from '@/vuex/mutation-types'

export default {
  name: 'app',
  created () {
    this.$store.dispatch(LOAD_USERS)
    this.$store.dispatch(LOAD_RANKS)
    this.$store.dispatch(LOAD_MONTHS)
  }
}
</script>

<style lang="stylus">
#app
  font-family "游ゴシック", YuGothic, "ヒラギノ角ゴ Pro", "Hiragino Kaku Gothic Pro", "メイリオ", "Meiryo", sans-serif
  -webkit-font-smoothing antialiased
  -moz-osx-font-smoothing grayscale
  font-size 80%

.btn#dropdownMenuButton
  width 160px
  margin 8px 16px
</style>
