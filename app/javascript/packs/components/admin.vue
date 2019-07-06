<template lang='pug'>
  q-card#card
    q-card-section.q-gutter-y-md.q-gutter-x-md.row
      q-input(v-model="formData.value" label="Value" mask="#.##" fill-mask="0" outlined).col
      q-field(outlined label="Ends at" stack-label).col
        template(v-slot:control="")
          div.self-center.full-width.no-outline {{ formData.endsAt }}
    q-card-section.q-gutter-y-md.q-gutter-x-md.row
      q-date(v-model='formData.endsAt' mask="YYYY-MM-DD HH:mm").col
      q-time(v-model='formData.endsAt' format24h mask="YYYY-MM-DD HH:mm").col
    q-card-section.row.justify-end
      q-btn(color="primary" :loading="loading" :disable='!submitEnabled'
        @click='submit') Submit
        template(v-slot:loading='')
          q-spinner-tail
</template>

<script>
  export default {
    data() {
      return {
        formData: {
          value: '1.10',
          endsAt: '2019-09-20 10:30',
        },
        loading: false,
      }
    },
    computed: {
      submitEnabled() {
        return this.formData.value &&
          this.formData.value > 0 &&
          this.$moment(this.formData.endsAt).isAfter(new Date())
      },
    },
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
        await this.axios({
          method: 'PUT',
          url: `v1/rates`,
          data: this.formData,
        })
      },
      async refreshRate() {
        const cb = async () => {
          const { data = {} } = await this.axios.get(`v1/admin`)
          if (data.value) this.formData.value = data.value.toString()
        }

        await this.$errorHandle(this, cb)
      },
    },
    async mounted() {
      await this.refreshRate()
    },
  }
</script>

<style scoped>
  #card {
    width: 700px;
  }
</style>
