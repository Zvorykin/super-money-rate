<template lang='pug'>
  q-layout(view='hHh lpR fFf')#app
    q-page-container
      q-page

        //router-view
</template>

<script>
  export default {
    components: {},
    channels: {
      RatesChannel: {
        received(data) {
          console.log(data)
        },
      },
    },
    data() {
      return {}
    },
    methods: { },
    async created() {
      this.axios.defaults.baseURL = `${ location.origin }/api`
      this.axios.defaults.headers.common['Content-Type'] = 'application/json'
      this.axios.defaults.headers.common['Accept'] = 'application/json'
    },
    mounted() {
      this.$cable.subscribe({ channel: 'RatesChannel' })
    },
  }
</script>

<style>
  .cards-container {
    margin: 0;
    padding-bottom: 15px;
  }
</style>
