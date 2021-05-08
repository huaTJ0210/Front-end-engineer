
import {INCREMENT,DECREMENT } from '../actionsType'
export const incrementAction = value => ({ data: value, type: INCREMENT });
export const decrementAction = value => ({ data: value, type: DECREMENT });