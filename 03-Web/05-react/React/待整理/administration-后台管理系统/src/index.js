import React from 'react';
import ReactDOM from 'react-dom';

import './index.css';
import App from './App';

// 路由组件
import { BrowserRouter } from 'react-router-dom'
// redux 配置
import store from './redux/store'
import { Provider } from 'react-redux'

ReactDOM.render(
  <Provider store={store}>
    <BrowserRouter>
      <App></App>
    </BrowserRouter>
  </Provider>
  ,
  document.getElementById('root')
);

