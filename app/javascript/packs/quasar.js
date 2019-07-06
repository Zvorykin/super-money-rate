import './styles/quasar.styl'
import iconSet from 'quasar/icon-set/ionicons-v4.js'
import '@quasar/extras/ionicons-v4/ionicons-v4.css'
import {
  ClosePopup,
  Notify,
  QLayout,
  QPageContainer,
  QPage,
  QBtn,
  QInput,
  QDate,
  QTime,
  QCard,
  QIcon,
  QInnerLoading,
  QSpinnerTail,
  QField,
  QCardSection,
  QDrawer,
  QTabs,
  QRouteTab
} from 'quasar'

Notify.setDefaults({ textColor: 'white' })

export default {
  config: {},
  components: {
    QLayout,
    QPageContainer,
    QPage,
    QBtn,
    QInput,
    QDate,
    QTime,
    QCard,
    QIcon,
    QInnerLoading,
    QSpinnerTail,
    QField,
    QCardSection,
    QDrawer,
    QTabs,
    QRouteTab
  },
  directives: {
    ClosePopup,
  },
  plugins: {
    Notify,
  },
  iconSet: iconSet,
}