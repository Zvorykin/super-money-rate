<template lang='pug'>
  q-layout(view='hHh lpR fFf')#app
    q-page-container
      q-page

        //router-view
</template>

<script>
  export default {
    components: { },
    data() {
      return {
      }
    },
    async created() {
      this.axios.defaults.baseURL = `${ location.origin }/api`
      this.axios.defaults.headers.common['Content-Type'] = 'application/json'
      this.axios.defaults.headers.common['Accept'] = 'application/json'
    },
  }
</script>

<style>
  #tab-panels .q-tab-panel {
    padding: 0 0 1px 0;
  }

  .footer, .header {
    background: white;
  }

  .cards-container {
    margin: 0;
    padding-bottom: 15px;
  }

  .black-text {
    color: rgba(0, 0, 0, 0.87);
  }
</style>
