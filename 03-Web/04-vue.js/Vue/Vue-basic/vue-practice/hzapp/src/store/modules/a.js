const a = {
  state: () => ({
    count: 0,
    size: 0,
  }),
  mutations: {
    increment() {
        this.state.count++;
    },
  },
  actions: {
    increment({ commit }) {
      commit('increment');
    },
  },
  getters: {
    counts() {
      return this.state.count + this.state.size;
    },
  },
};

export default a;
