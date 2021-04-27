import Vue from 'vue'
import Vuex from 'vuex'
import moduleA from './modules/moduleA'
import moduleB from './modules/moduleB'

Vue.use(Vuex)

const store = Vuex.Store({
    modules: {
        a: moduleA,
        b: moduleB
    }
})
export default store