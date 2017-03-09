<template lang="pug">

input.form-control(
  v-model.lazy.number="power",
  onfocus="this.select()"
)

</template>

<script>
import { mapActions, mapGetters } from 'vuex'
import { CHANGE_WORK } from '@/vuex/mutation-types'

export default {
  name: 'Power',
  props: ['user', 'month'],
  methods: mapActions([CHANGE_WORK]),
  computed: {
    ...mapGetters(['workByUserMonth']),
    power: {
      get () {
        return this.workByUserMonth(this.user.id, this.month.format('YYYY-MM'))
      },
      set (power) {
        this.CHANGE_WORK([this.user, this.month, power])
      }
    }
  }
}

</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style lang="stylus" scoped>

input
  width 100%
  height 100%
  padding 2px 4px


</style>
