export default {
    namespace: 'products', // 全局state上的key
    state: [],// 初始值
    // 异步处理的例如网络请求等操作
    effects: {
        *requestList({ payload }, { call, put }) {
            // call 相当于异步请求数据
            const result = yield call(() => {
                return 2;
            }, payload);
            // put 则是dispatch--action将state更改
            yield put({
                type: 'delete',
                payload: result
            });
        },// 请求数据成功
    },
    reducers: {
        // 同步改变状态的
        delete(state, { payload: id }) {
            return state.filter(item => item.id !== id)
        },
    }
}