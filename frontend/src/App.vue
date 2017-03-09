<template lang="pug">
#app
  link(
    href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css",
    rel="stylesheet",
    integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ",
    crossorigin="anonymous"
  )
  nav.navbar.navbar-toggleable-md
    .navbar-brand Workplan
    .navbar-nav
      router-link.nav-item.nav-link(to="/workplan/frontend/works") 要員計画

  router-view

</template>

<script>
export default {
  name: 'app'
}
</script>

<style lang="stylus">
#app
  font-family "游ゴシック", YuGothic, "ヒラギノ角ゴ Pro", "Hiragino Kaku Gothic Pro", "メイリオ", "Meiryo", sans-serif
  -webkit-font-smoothing antialiased
  -moz-osx-font-smoothing grayscale
  font-size 80%

</style>
