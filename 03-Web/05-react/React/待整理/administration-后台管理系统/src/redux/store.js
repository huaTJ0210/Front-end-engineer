// 组件状态统一管理者
import { createStore, applyMiddleware } from 'redux'
import reducers from './reducers/index'
import thunk  from 'redux-thunk'

import { composeWithDevTools } from 'redux-devtools-extension'

export default createStore(reducers,
    composeWithDevTools(applyMiddleware(thunk))
);