<template lang="pug">

#chartContainer

</template>

<script>
import { mapGetters } from 'vuex'

export default {
  name: 'WorksGraph',
  created () {
    console.log('created')
  },
  computed: mapGetters(['months', 'ranks', 'users', 'works']),
  mounted () {
    var chart = new window.CanvasJS.Chart('chartContainer', {
      title: {
        text: '要員計画',
        margin: 15
      },
      toolTip: {
        shared: true
      },
      axisX: {
        valueFormatString: 'MM月',
        interval: 1,
        intervalType: 'month'
      },
      axisY: {
        maximum: 40,
        interval: 10
      },
      data: ['alice', 'bob', 'chris'].map(name => {
        return {
          type: 'stackedArea',
          name: name,
          showInLegend: 'true',
          dataPoints: this.months.map(m => {
            return { x: m.date, y: 11 }
          })
        }
      })
    })
    chart.render()
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style lang="stylus" scoped>

#chartContainer
  width 640px
  height 400px

</style>
