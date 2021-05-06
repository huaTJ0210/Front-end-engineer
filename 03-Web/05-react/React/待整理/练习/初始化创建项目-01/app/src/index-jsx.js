
import React from 'react' // 创建组件、声明周期
import ReactDOM from 'react-dom' // 把创建好的组件和虚拟DOM放到页面展示

// JSX 语法
const a = 10;
const arr = ['鸣人', '小樱', '佐助', '自来也'];

const el = <div>
  {a}
  <hr></hr>
  {
    arr.map((item, index) => <h4 key={index}>{item}</h4>)
  }
  <hr></hr>
  <p className='pClass'>test p </p>
</div>

ReactDOM.render(el, document.getElementById('app'));