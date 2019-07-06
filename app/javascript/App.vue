<template lang='pug'>
  q-layout(view='hHh lpR fFf').fullscreen
    q-drawer(v-model="drawerVisible" :width="150")
      q-tabs(vertical).text-white.bg-primary
        q-route-tab(to="/current-rate") Current rate
        q-route-tab(to="/admin") Admin
    q-page-container
      q-page.cards-container
        router-view
</template>

<script>
  export default {
    components: {},
    data() {
      return {
        drawerVisible: true
      }
    },
    methods: {},
    async created() {
      this.axios.defaults.baseURL = `${ location.origin }/api`
      this.axios.defaults.headers.common['Content-Type'] = 'application/json'
      this.axios.defaults.headers.common['Accept'] = 'application/json'
    },
  }
</script>

<style>
  .cards-container {
    margin: 0;
    padding-bottom: 15px;
  }
</style>
