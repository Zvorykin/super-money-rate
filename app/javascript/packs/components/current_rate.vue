<template lang="pug">
  q-card
    q-card-section
      p Current rate: {{ value }}
</template>

<script>
  export default {
    components: {},
    channels: {
      RatesChannel: {
        received({ title, body }) {
          if (title === 'rate updated') {
            this.value = body.value

            this.$q.notify({
              color: 'secondary',
              position: 'top',
              message: 'Rate updated!',
              timeout: 2000,
            })
          }
        },
      },
    },
    data() {
      return {
        value: 0
      }
    },
    computed: {},
    watch: {},
    methods: {}
  }
</script>

<style scoped>

</style>
