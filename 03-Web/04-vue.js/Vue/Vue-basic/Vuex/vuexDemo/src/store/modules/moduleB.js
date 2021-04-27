const moduleB = {
  state: () => ({
    count: 0,
    size: 0
  }),
  mutations: {
    increment() {
      state.count++
    }
  },
  actions: {
    increment({ commit }) {
      commit('increment')
    }
  },
  getters: {
    counts() {
      return state.count + state.size
    }
  }
}

export default moduleB
