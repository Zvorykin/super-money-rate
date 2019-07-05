<template lang='pug'>
  q-card
    q-card-section.q-gutter-y-md
      q-input(v-model="formData.value" label="Value" mask="#.##" fill-mask="0" outlined)
      q-input(v-model="formData.date" type='date' hint="Fix end date" outlined)
      q-input(v-model="formData.time" type='time' hint="Fix end time" outlined)
    q-card-section.row.justify-end
      q-btn(color="primary" :loading="loading" @click='submit') Submit
        template(v-slot:loading='')
          q-spinner-tail
</template>

<script>
  export default {
    data() {
      return {
        formData: {
          value: 1.10,
          date: '2019-07-10',
          time: '10:30',
        },
        loading: false,
      }
    },
    computed: {},
    watch: {},
    methods: {
      async submit() {
        await this.$errorHandle(this, this.fixRate)

        this.$q.notify({
          color: 'secondary',
          position: 'top',
          message: 'Successful!',
          timeout: 2000,
        })
      },
      async fixRate() {
        const [hour, minute] = this.formData.time.split(':')
        const endsAt = this.$moment(this.formData.date).set({
          'hour': hour,
          'minute': minute,
        })

        await this.axios({
          method: 'PUT',
          url: `v1/rates`,
          data: {
            value: this.formData.value,
            endsAt,
          },
        })
      },
    },
  }
</script>

<style scoped>
</style>
