<template lang='pug'>
  q-card#card
    q-card-section.q-gutter-y-md
      q-input(v-model="formData.title" label="Заголовок" outlined)
      q-input(v-model="formData.description" label="Описание" outlined type="textarea"
        autogrow)
    q-card-section.q-gutter-x-md.row
      q-input(v-model="formData.reward" input-class="text-right" outlined
        prefix="$" mask="#.##" fill-mask="0" label="Вознаграждение").col-5
      q-input(v-model.number="formData.maxAssignments" outlined :min="1"
        label="Макс. кол-во назначений" type="number").col
    q-card-section.q-gutter-x-md.row
      q-input(v-model.number="formData.lifetime" label="Время публикации, дней"
        outlined type="number" :min="1" input-class="text-right").col-5
      q-input(v-model.number="formData.assignmentDuration" label="Длительность выполнения, минут"
        outlined type="number").col
    q-separator(inset)
    q-card-section.q-gutter-x-md.row
      q-input(v-model.number="formData.hitsAmount" :min="1" label="Кол-во заданий"
        outlined type="number" input-class="text-right").col-5
      q-input(v-model.number="formData.photosPerHit" :min="1" label="Кол-во фото в задании"
        outlined type="number").col
    q-card-section.q-gutter-x-md.row
      q-input(v-model.number="formData.overlapPercentage" label="Процент перекрытия фото"
        prefix="%" outlined type="number" :min="0" input-class="text-right").col-5
      q-input(v-model="formData.query" label="Текст поиска" outlined).col
      q-checkbox(v-model="formData.tagPresence" label="Наличие тегов"
        outlined toggle-indeterminate).col
    q-card-section.row.justify-end
      q-btn(color="primary" :loading="loading" @click='submit') Создать
        template(v-slot:loading='')
          q-spinner-tail
</template>

<script>
  export default {
    data() {
      return {
        formData: {
          title: '',
          description: '',
          reward: '1.00',
          assignmentDuration: 20,
          lifetime: 7,
          maxAssignments: 1,
          hitsAmount: 2,
          photosPerHit: 5,
          overlapPercentage: 0,
          query: '',
          tagPresence: false
        },
        loading: false
      }
    },
    computed: {},
    watch: {},
    methods: {
      async submit() {
        await this.$errorHandle(this, this.createHITs)

        this.$q.notify({
          color: 'secondary',
          position: 'top',
          message: 'Успешно выполнено!',
          timeout: 2000
        })

        this.$emit('hitsCreated')
      },
      async createHITs() {
        const data = {
          ...this.formData,
          assignmentDuration: this.formData.assignmentDuration * 60, //minutes
          lifetime: this.formData.lifetime * 60 * 60 * 24 //days
        }

        await this.axios({
          method: 'POST',
          url: `v1/hits`,
          data: data,
        })
      }
    },
  }
</script>

<style scoped>
  #card {
    width: 600px
  }
</style>
