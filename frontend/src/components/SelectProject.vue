<template lang="pug">

.form-inline
  label.mr-sm-2(for="inlineform") 案件
    select.custom-select.mb-2.mr-sm-2.mb-sm-0#inlineform(v-model="myProject")
      option(v-for="project in projects", :value="project") {{ project.number}} {{ project.name }}

</template>

<script>
import { mapGetters } from 'vuex'

export default {
  name: 'SelectProject',
  computed: {
    ...mapGetters(['project', 'projects']),
    myProject: {
      get () {
        return this.project
      },
      set (project) {
        this.$store.commit('SET_PROJECT', project)
      }
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style lang="stylus" scoped>
.form-inline
  margin 8px 16px
</style>
