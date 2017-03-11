<template lang="pug">

input.form-control(
  v-model.lazy.number="power",
  onfocus="this.select()",
  @keyup="handleKeydown",
  :id="`user${index}month${month.id}`"
)

</template>

<script>
import { mapActions, mapGetters } from 'vuex'
import { CHANGE_WORK } from '@/vuex/mutation-types'

function select (query) {
  const cell = document.querySelector(query)
  if (cell !== null) {
    cell.select()
  }
}

export default {
  name: 'Power',
  props: ['user', 'index', 'month'],
  methods: {
    ...mapActions([CHANGE_WORK]),
    handleKeydown (e) {
      if (e.code === 'ArrowRight') {
        const query = `#user${this.index}month${this.month.id + 1}`
        select(query)
      }
      if (e.code === 'ArrowLeft') {
        const query = `#user${this.index}month${this.month.id - 1}`
        select(query)
      }
      if (e.code === 'ArrowUp') {
        const query = `#user${this.index - 1}month${this.month.id}`
        select(query)
      }
      if (e.code === 'ArrowDown') {
        const query = `#user${this.index + 1}month${this.month.id}`
        select(query)
      }
    }
  },
  computed: {
    ...mapGetters(['workPower']),
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
