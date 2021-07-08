import { INCREMENT, DECREMENT, ADD_NUM, SUB_NUM } from './action_constant.js';
const initialState = {
  counter: 0,
};

function reducer(state = initialState, action) {
  switch (action.type) {
    case INCREMENT:
      return { ...state, counter: state.counter + 1 };
    case DECREMENT:
      return { ...state, counter: state.counter - 1 };
    case ADD_NUM:
      console.log(action);
      return { ...state, counter: state.counter + action.num };
    case SUB_NUM:
      return { ...state, counter: state.counter - action.num };
    default:
      return state;
  }
}

export default reducer;
