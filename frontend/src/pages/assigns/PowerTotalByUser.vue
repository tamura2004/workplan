<template lang="pug">

span {{ assignPowerTotalByUser(user) / 100 }}

</template>

<script>
import { mapGetters } from 'vuex'

export default {
  name: 'AssignPowerTotalByUser',
  props: ['user'],
  computed: mapGetters(['assignPowerTotalByUser'])
}

</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style lang="stylus" scoped>

span
  width 100%
  height 100%
  padding 2px 4px
  font-size 0.8rem

</style>
