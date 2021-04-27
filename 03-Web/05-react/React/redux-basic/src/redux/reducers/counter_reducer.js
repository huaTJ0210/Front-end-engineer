import { INCREMENT, DECREMENT } from '../actionsType'
/*
  (1) reducer 函数一定要返回当前状态
*/
export default function reducer(preState = { count: 1 }, action) {
    console.log('counter reducer');
    switch (action.type) {
        case INCREMENT:
            {
                let state = { ...preState }; // 获取旧状态
                state.count = state.count + action.data * 1; // 更改新状态中的属性值
                console.log(state);
                return state; // 返回新状态
            }
        case DECREMENT:
            {
                let state = { ...preState }
                state.count = state.count - action.data * 1; // 更改新状态中的属性值
                return state; // 返回新状态
            }; // 获取旧状态

        default: {
            console.log(preState);
            return preState;
        }

    }
}