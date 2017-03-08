<template lang="pug">

input.form-control(
  min="0",
  max="10",
  step="0.1",
  type="number",
  :value="power",
  onfocus="this.select()"
)

</template>

<script>

export default {
  name: 'WorkForm',
  props: ['userId', 'month'],
  data () {
    return {
      power: 2
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
