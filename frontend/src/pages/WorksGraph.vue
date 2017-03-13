<template lang="pug">

#chartContainer

</template>

<script>

export default {
  name: 'WorksGraph',
  created () {
    console.log('created')
  },
  mounted () {
    console.log('mounted')
    console.log(document.getElementById('chartContainer'))

    const chart = new document.CanvasJS.Chart('chartContainer', {
      theme: 'theme4',
      title: {
        text: '要員計画'
      },
      animationEnabled: true,
      data: [
        {
          type: 'line',
          lineThickness: 4,
          markerSize: 12,
          legendText: 'one',
          dataPoints: [1, 3, 2]
        },
        {
          type: 'line',
          lineThickness: 4,
          markerSize: 12,
          legendText: 'two',
          dataPoints: [3, 2, 1]
        },
        {
          type: 'line',
          lineThickness: 4,
          markerSize: 12,
          legendText: 'three',
          dataPoints: [2, 1, 3]
        }
      ]
    })

    console.log(chart)
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
