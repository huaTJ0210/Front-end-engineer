import store from './store/index.js';

import {
  incrementAction,
  decrementAction,
  subNumAction,
  addNumAction,
} from './store/actionCreators.js';

store.dispatch(incrementAction());
store.dispatch(decrementAction());
store.dispatch(addNumAction(1));
store.dispatch(subNumAction(12));
