<template lang="pug">
.container.pt-4
  h5 稼働計画
  table.table.table-sm.table-bordered
    thead.bg-faded
      tr
        th rank
        th 番号
        th 氏名
        th(v-for="month in months") {{ month.name }}
        th 合計
    tbody
      tr(v-for="(user, row) in orderBy(users, 'rank_id')")
        td {{ user.rank_id }}
        td {{ user.number }}
        td {{ user.name }}
        td#month(v-for="(month, col) in months")
          WorkPower(
            :row="row",
            :col="col",
            :user="user",
            :month="month"
          )
        td
          WorkPowerTotalByUser(:user="user")
      tr
        td(colspan="3") 合計
        td(v-for="month in months")
          WorkPowerTotalByMonth(:month="month")
        td
          WorkPowerTotal

</template>

<script>
import { mapGetters } from 'vuex'

import WorkPower from './works/Power'
import WorkPowerTotalByMonth from './works/PowerTotalByMonth'
import WorkPowerTotalByUser from './works/PowerTotalByUser'
import WorkPowerTotal from './works/PowerTotal'
import { LOAD_WORKS } from '@/vuex/mutation-types'

export default {
  name: 'Works',
  components: { WorkPower, WorkPowerTotalByMonth, WorkPowerTotalByUser, WorkPowerTotal },
  computed: mapGetters(['works', 'months', 'users']),
  created () {
    this.$store.dispatch(LOAD_WORKS)
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style lang="stylus" scoped>
table
  font-size 80%
// number, name
for col in 1
  th:nth-child({col})
    width 2.8%

for col in 2
  th:nth-child({col})
    width 5.6%

for col in 3
  th:nth-child({col})
    width 11.2%

for col in 4 5 6 7 8 9 10 11 12 13 14 15 16
  th:nth-child({col})
    width 5.6%

td#month
  padding 0
  height 24px
  position relative

  input
    top 0
    width 100%
    height 100%
    padding 2px 4px

</style>
