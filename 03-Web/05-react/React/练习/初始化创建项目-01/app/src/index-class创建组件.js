
import React from 'react' // 创建组件、声明周期
import ReactDOM from 'react-dom' // 把创建好的组件和虚拟DOM放到页面展示

import HelloWorld from './components/HelloWorld'

// --- 创建组件 ----

const dog = {
  name: 'li',
  age: 3
}

const el = <div>
  {/* <Hello name={dog.name}></Hello> */}
  <HelloWorld {...dog}></HelloWorld>
</div>

ReactDOM.render(el, document.getElementById('app'));