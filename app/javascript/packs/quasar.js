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
  QCard,
  QIcon,
  QInnerLoading,
  QSpinnerTail,
  QSelect,
  QCheckbox,
  QField,
  QCardSection,
  QCardActions,
  QSplitter,
  QSeparator,
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
    QCard,
    QIcon,
    QInnerLoading,
    QSpinnerTail,
    QSelect,
    QCheckbox,
    QField,
    QCardSection,
    QCardActions,
    QSplitter,
    QSeparator,
  },
  directives: {
    ClosePopup,
  },
  plugins: {
    Notify,
  },
  iconSet: iconSet,
}