
import { combineReducers } from 'redux'
import counterReducer from './counter_reducer'
import personReducer from './person_reducer'
/*
   store中保存了所有组件的状态，
   是一个一般对象
*/
export default combineReducers({
    counter: counterReducer,
    person: personReducer
});