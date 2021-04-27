import Vue from 'vue'
import App from './App.vue'
import store from './store'

Vue.config.productionTip = false

// 从根组件注入store
new Vue({
  store,
  render: h => h(App)
}).$mount('#app')
