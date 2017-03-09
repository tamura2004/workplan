<template lang="pug">
.container
  h1 要員計画
  table.table.table-sm
    thead
      tr
        th rank
        th#number 番号
        th#name 氏名
        th(v-for="month in months") {{ month.format('MM月') }}
    tbody
      tr(v-for="user in orderBy(users, 'rank_id')")
        td {{ user.id }}
        td {{ user.number }}
        td {{ user.name }}
        td#month(v-for="month in months")
          WorkForm(
            :power="workByUserMonth(user.id, month.format('YYYY-MM'))",
            :userId="user.id",
            :month="month.format('YYYY-MM')"
          )
  p {{ works }}

</template>

<script>
import { mapGetters } from 'vuex'
import moment from 'moment'
import USERS from '@/assets/users'
import WorkForm from '@/components/WorkForm'

export default {
  name: 'Works',
  components: { WorkForm },
  computed: {
    ...mapGetters(['works', 'workByUserMonth']),
    months () {
      return Array.from(new Array(12)).map((v, i) => moment().add(i, 'months'))
    }
  },
  data () {
    return {
      users: USERS
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style lang="stylus" scoped>
#name, #number
  width 100px
  
td#month
  padding 0
  height 100%
  
  input
    width 100%
    height 100%
    padding 2px 4px


</style>
