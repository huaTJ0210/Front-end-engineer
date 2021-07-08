import { INCREMENT, DECREMENT, ADD_NUM, SUB_NUM } from './action_constant.js';

export const incrementAction = () => ({ type: INCREMENT });
export const decrementAction = () => ({ type: DECREMENT });
export const addNumAction = (num) => ({ type: ADD_NUM, num });
export const subNumAction = (num) => ({ type: SUB_NUM, num });
