import { createStore } from 'redux'

import reducers from './reducers'

import { composeWithDevTools } from 'redux-devtools-extension'


/*
  redux: 调试工具
  npm install --save-dev redux-devtools-extension
*/

export default createStore(reducers, composeWithDevTools());