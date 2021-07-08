import React from 'react';
import ReactDOM from 'react-dom';
import App from './App';
import './assets/css/base.css'


ReactDOM.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
  document.getElementById('root')
);

/*
  (0) 组织项目目录结构
  (1) normalize.css : 整体项目初始化
     + npm install --save normalize.css
  (2) 合并自定义样式清除代码
  (3) 安装@craco/craco，修改webpack的配置
   + 修改package.json中scripts中的 react-scripts --》craco
   + 新增craco.config.js文件用来修改webpack的配置
  (4)项目整体拆分组件
  + 头部组件
  + 内容组件(router承载)
  + 尾部组件
  （5）安装react-router-dom
  + yarn add react-router-dom
  （6）安装react-router的配置文件 [统一管理router的配置]
   + yarn add react-router-config 
   （7）router文件夹下进行路由的相关配置
   (8)pages 页面中的组件创建
   （9）router 中导入组件配置routes
    （10）renderRoutes 最外层必须有HashRouter/BrowserRouter包裹
    （11）yarn add styled-components ：在js文件中使用css
    （12）yarn add antd
    (13) yarn add @ant-design/icons
    （14）yarn add axios
    (15) yarn add redux react-redux redux-thunk

*/


