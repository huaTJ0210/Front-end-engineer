import { createStore } from 'redux';
import reducer from './reducer.js';

const store = createStore(reducer);
store.subscribe(() => {
  console.log('counter:' + store.getState().counter);
});
export default store;
