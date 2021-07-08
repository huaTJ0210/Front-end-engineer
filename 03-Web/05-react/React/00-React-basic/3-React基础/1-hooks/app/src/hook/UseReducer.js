import React, { useReducer } from 'react';

const initialState = { count: 0 };
function reducer(state, action) {
  switch (action.type) {
    case 'increment':
      return { count: state.count + 1 };
    case 'decrement':
      return { count: state.count - 1 };
    default:
      throw new Error();
  }
}

export default function Counter() {
  // useReducer只是usestate的代替品而已，用来处理较为复杂的state；
  const [state, dispatch] = useReducer(reducer, initialState);
  return (
    <>
      Count:{state.count}
      <button onClick={() => dispatch({ type: 'increment' })}>+1</button>
    </>
  );
}
