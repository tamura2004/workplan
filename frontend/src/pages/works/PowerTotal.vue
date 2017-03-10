<template lang="pug">

p {{ powerTotal }}

</template>

<script>
import { mapGetters } from 'vuex'

export default {
  name: 'PowerTotal',
  computed: mapGetters(['powerTotal'])
}

</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style lang="stylus" scoped>

p
  width 100%
  height 100%
  padding 2px 4px
  font-size 0.8rem

</style>
