<template lang="pug">
  q-card#card
    q-card-section
      q-field(borderless)
        template(v-slot:control="")
          div.self-center.full-width.no-outline Current rate: {{ value }}
</template>

<script>
  export default {
    channels: {
      RatesChannel: {
        received({ title, body }) {
          if (title === 'rate updated' && body && body.value ) {
            this.value = body.value
          }
        },
      },
    },
    data() {
      return {
        value: '-'
      }
    },
    computed: {},
    watch: {},
    methods: {},
    mounted() {
      this.$cable.subscribe({ channel: 'RatesChannel' })
    },
  }
</script>

<style scoped>
  #card {
    width: 200px
  }
</style>
