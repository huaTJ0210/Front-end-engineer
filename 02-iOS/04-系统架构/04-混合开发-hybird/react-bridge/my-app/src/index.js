import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App.jsx';

 /**
  *  将与原生交互的bridge对象挂载到React下，并绑定全局函数
  *  调用原生方法示例
  * 
     var self = this;
      React.$bqJSBridgeService('firstPageClick', { name: 'li' }, function(data) {
        self.setState({
          text: data.name
        });
      });

  * */ 
 var u = navigator.userAgent;
 var isiOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/);
 if(isiOS){
      // iOS 初始化
     React.$bridge =  window.WebViewJavascriptBridge;
 }else{
     // android初始化（安卓初始化对象较晚）
     document.addEventListener(
     'WebViewJavascriptBridgeReady',function(){
      React.$bridge = window.WebViewJavascriptBridge;
     });
 }

React.$bqJSBridgeService = function (funcName, funcParams, callbackFuc) {
  var lastParams = { 'FUNC_NAME': funcName, 'FUNC_PARAMS': funcParams };
  if (typeof (React.$bridge) == 'undefined') {
    document.addEventListener(
      'WebViewJavascriptBridgeReady', function () {
        React.$bridge = window.WebViewJavascriptBridge;
        React.$bridge.callHandler('BQJSBridgeService', lastParams, function (response) {
          if (typeof response == 'string') {
            response = JSON.parse(response)
            callbackFuc(response);
          } else {
            callbackFuc(response);
          }
        })
      });
  } else {
    React.$bridge.callHandler('BQJSBridgeService', lastParams, function (response) {
      if (typeof response == 'string') {
        response = JSON.parse(response)
        callbackFuc(response);
      } else {
        callbackFuc(response);
      }
    });
  }
};


// 注意bridge的绑定一定在ReactDOM渲染前，不然业务组件的componentDidMount方法中获取React.$bridge会为空对象
 ReactDOM.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
  document.getElementById('root')
);


