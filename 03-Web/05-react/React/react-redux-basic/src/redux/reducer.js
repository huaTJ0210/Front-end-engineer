import { INCREMENT, DECREMENT } from './actionsType.js'
/*
  (1) reducer 函数一定要返回当前状态
*/
const initState = {
    count: 1,
    age: 2
}
export default function reducer(preState = initState, action) {
    switch (action.type) {
        case INCREMENT:
            {
                // 此处必须新创建对象，不然无法进行更新（state不改变）
                let state = { ...preState }; // 以旧状态创建一个新对象
                console.log('reducer--(1)' + preState);
                state.count = preState.count + action.data * 1
                return state; // 返回新状态
            }
        case DECREMENT:
            {
                let state = { ...preState }; // 以旧状态创建一个新对象
                state.count = state.count - action.data * 1; // 更改新状态中的属性值
                console.log(state.count)
                return state; // 返回新状态
            }
        default:
            console.log(preState.count)
            return preState;
    }
}