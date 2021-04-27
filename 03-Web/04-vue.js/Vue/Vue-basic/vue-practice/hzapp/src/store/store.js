import Vue from "vue";
import Vuex from "vuex";
import a from "./modules/a";
import b from "./modules/b";

Vue.use(Vuex);

const store = new Vuex.Store({
  modules: {
    a: a,
    b: b
  }
});
export default store;
