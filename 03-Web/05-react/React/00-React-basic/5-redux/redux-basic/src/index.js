import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';

import store from './redux/store'

ReactDOM.render(
  <App store={store} />,
  document.getElementById('root')
);

// 订阅状态变动
store.subscribe(() => {
  ReactDOM.render(
    <App store={store} />,
    document.getElementById('root')
  );
});

