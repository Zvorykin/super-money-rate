import Router from 'vue-router'

import Admin from './components/admin'
import CurrentRate from './components/current_rate'

export default new Router({
  routes: [
    {
      path: '/admin',
      name: 'Admin',
      component: Admin,
    },
    {
      path: '/current-rate',
      name: 'CurrentRate',
      component: CurrentRate,
    },
  ],
})