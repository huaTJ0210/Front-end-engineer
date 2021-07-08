import './App.css';
/*
  Effect Hook : 可以在函数组件中执行副作用
  (1) 解决类组件中相同的逻辑代码在不同的生命周期函数中调用的问题
 （2） 实现不同业务的代码分离
*/

import React, { useState, useEffect } from 'react';

function App() {
  const [count, setCount] = useState(0);
  const [age, setAge] = useState(20);

  useEffect(() => {
    document.title = `you clicked ${count} times`;
  }, [count]); // 仅在count发生改变时变更

  return (
    <div className='App'>
      <p>{count}</p>
      <button onClick={() => setCount(count + 1)}>+1</button>
      <hr></hr>
      <p>age:{age}</p>
      <button onClick={() => setAge(age + 10)}>修改年龄</button>
    </div>
  );
}

export default App;

/*
  函数组件：
  + 初始化state，给组件绑定状态
  + 使用生命周期函数
  + 
*/
class Hello extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      name: 'li',
    };
  }
  componentDidMount() {}
  componentDidUpdate() {}
  componentWillUnmount() {}
  shouldComponentUpdate(prevProps, prevState) {
    return true;
  }
  render() {
    return <div>{this.state.name}</div>;
  }
}
