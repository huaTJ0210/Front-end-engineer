
import {INCREMENT,DECREMENT } from './actionsType.js'
export const incrementAction = value => ({ data: value, type: INCREMENT });
export const decrementAction = value => ({ data: value, type: DECREMENT });
export const asyncIncrementAction = (value, delay) => { 
    // 借助底层的dispatch 在延迟后再执行action的返回对象
    return (dispatch) => { 
        setTimeout(() => { 
            dispatch(incrementAction(value))
        },delay)
    }
}