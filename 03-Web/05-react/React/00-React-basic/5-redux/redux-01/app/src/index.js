import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';
import store from './store/index';
import { StoreContext } from './utils/storeContext';

ReactDOM.render(
  <StoreContext.Provider value={store}>
    <App />
  </StoreContext.Provider>,
  document.getElementById('root')
);
