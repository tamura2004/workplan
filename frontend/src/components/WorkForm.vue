<template lang="pug">

input.form-control(
  min="0",
  max="10",
  step="0.1",
  type="number",
  :value="power",
  @click="CHANGE_WORK({userId: userId, month: month, power:power})"
  onfocus="this.select()"
)

</template>

<script>
import { mapActions } from 'vuex'
import { CHANGE_WORK } from '@/vuex/mutation-types'

export default {
  name: 'WorkForm',
  props: ['userId', 'month', 'power'],
  methods: mapActions([CHANGE_WORK])
}

</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style lang="stylus" scoped>

input
  width 100%
  height 100%
  padding 2px 4px


</style>
