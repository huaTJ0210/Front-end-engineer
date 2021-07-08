import '../App.css';
/*
  Hook是react的新特性，可以在不编写class的情况下使用state和其他react特性（生命周期）

   (1) 组件之间复用状态逻辑很难 ==》 代码复用 
  （2）复杂组件变得难以理解 ： 生命周期函数中业务逻辑比较复杂 ==》 代码管理
  （3）class的笨重
*/

import { useState } from 'react';

function App() {
  const [count, setCount] = useState(0);
  const [age, setAge] = useState(20);
  // 更新对象的情况
  const [state, setState] = useState({});

  return (
    <div className='App'>
      <p>{count}</p>
      <button onClick={() => setCount(count + 1)}>+1</button>
      <button
        onClick={
          // 函数式更新
          () => setCount((preCount) => preCount + 1)
        }
      >
        +1
      </button>
      <hr></hr>
      <p>age:{age}</p>
      <button onClick={() => setAge(age + 10)}>修改年龄</button>
      <p>state:{state}</p>
      <button
        onClick={() =>
          setState((preState) => {
            // 使用展开运算符来达到合并新对象的能力
            return { ...preState, ...{ name: 'li', age: 18 } };
          })
        }
      >
        修改年状态
      </button>
    </div>
  );
}

export default App;
