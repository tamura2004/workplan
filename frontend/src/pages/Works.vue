<template lang="pug">
.container
  h5 要員計画
  table.table.table-sm.table-bordered
    thead.bg-faded
      tr
        th rank
        th#number 番号
        th#name 氏名
        th(v-for="month in months") {{ month.name }}
        th 合計
    tbody
      tr(v-for="user in orderBy(users, 'rank_id')")
        td {{ user.rank_id }}
        td {{ user.number }}
        td {{ user.name }}
        td#month(v-for="month in months")
          Power(
            :user="user",
            :month="month"
          )
        td#usertotal
          PowerTotalByUser(:user="user")
      tr
        td(colspan="3") 合計
        td(v-for="month in months")
          PowerTotalByMonth(:month="month")
        td
          PowerTotal

</template>

<script>
import { mapGetters } from 'vuex'
import Power from './works/Power'
import PowerTotalByMonth from './works/PowerTotalByMonth'
import PowerTotalByUser from './works/PowerTotalByUser'
import PowerTotal from './works/PowerTotal'

export default {
  name: 'Works',
  components: { Power, PowerTotalByMonth, PowerTotalByUser, PowerTotal },
  computed: mapGetters(['works', 'months', 'users'])
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style lang="stylus" scoped>
#name, #number
  width 11.2%

#usertotal
  width 5.6%
  
td#month
  padding 0
  width 5.6%
  height 100%
  
  input
    width 100%
    height 100%
    line-height 100%
    padding 2px 4px

</style>
