
import React from 'react' // 创建组件、声明周期
import ReactDOM from 'react-dom' // 把创建好的组件和虚拟DOM放到页面展示

/*
  2 创建虚拟DOM元素
  <h1 id='myH1'>my h1</h1>
  + 参数1：创建元素的类型，字符串，表示元素的名称
  + 参数2：一个对象或者null，当前DOM元素的属性
  + 参数3：子节点（虚拟DOM、文本子结点）
  + 参数N: 其他子节点
*/
const myH1 = React.createElement('h1', { id: 'myh1', title: 'this is h1' }, 'my h1');
// 将虚拟的myH1 放在myDiv下面
const myDiv = React.createElement('div', null, 'my div', myH1);
/*
  3、ReactDOM将虚拟DOM渲染到界面
  + 参数1：要渲染的虚拟DOM元素
  + 参数2：指定页面上一个容器（DOM元素而不是选择器）
*/
//ReactDOM.render(myDiv, document.getElementById('app'));

// 渲染页面的DOM结构/

/*
  js文件中默认不能写类似html的标记语言
  可以使用babel转换这些js的标签；
  JSX语法
  （1）装babel [ babel-core babel-loader 版本要对应]
  + npm i babel-core babel-loader babel-plugin-transform-runtime -D
  + npm i babel-preset-env babel-preset-stage-0 babel-preset-react -D
  + 
*/

const testDiv = <div id='testDiv'>这是div元素</div>
ReactDOM.render(testDiv, document.getElementById('app'));