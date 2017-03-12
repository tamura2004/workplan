<template lang="pug">

input.form-control(
  v-model.lazy.number="power",
  onfocus="this.select()",
  @keyup="handleKeydown",
  :id="cellId(0,0)"
)

</template>

<script>
import { mapActions, mapGetters } from 'vuex'
import { CHANGE_WORK } from '@/vuex/mutation-types'
import moveWithArrowKey from '@/lib/moveWithArrowKey'

export default {
  name: 'Power',
  props: ['user', 'month', 'row', 'col'],
  methods: {
    ...mapActions([CHANGE_WORK]),
    handleKeydown (e) {
      console.log(e)
      moveWithArrowKey(e, this.cellId)
    }
  },
  computed: {
    ...mapGetters(['workPower']),
    cellId () {
      return (x, y) => `user${this.row + y}month${this.col + x}`
    },
    power: {
      get () {
        return this.workPower(this.user, this.month)
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
  font-size 0.8rem
  border-radius 0

</style>
