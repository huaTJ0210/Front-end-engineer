
import React from 'react' // 创建组件、声明周期
import ReactDOM from 'react-dom' // 把创建好的组件和虚拟DOM放到页面展示

import Hello from '@/components/Hello'

// --- 创建组件 ----

// 0 es6中的展开运算符

var o2 = {
  age: 22,
  address: '北京',
  phone: '1237583'
}
var o1 = {
  name: 'o1',
  ...o2 // 将o2中的属性都赋值给o1
}

/*
  1 函数创建 <Hello></Hello>;组件中的props是只读的
   组件首字母大写
*/
// function Hello(props) {
//   //return null; // 标识什么都不渲染
//   return <h3>{props.name}</h3>
// }

const dog = {
  name: 'da dog',
  age: 3
}

// 2 

const el = <div>
  {/* <Hello name={dog.name}></Hello> */}
  <Hello {...dog}></Hello>
</div>

ReactDOM.render(el, document.getElementById('app'));