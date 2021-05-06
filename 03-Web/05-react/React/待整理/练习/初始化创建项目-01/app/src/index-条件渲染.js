import React from 'react' // 创建组件、声明周期
import ReactDOM from 'react-dom' // 把创建好的组件和虚拟DOM放到页面展示

function Greeting(props) {
  if (props.isCheck) {
    return <h2>hello User</h2>
  } else {
    return <h3>hello stranger</h3>
  }
}
/*
  条件渲染
*/
class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      isCheck: false
    };

  }
  render() {
    // 条件渲染
    return <Greeting isCheck={false}></Greeting>
  }
}

ReactDOM.render(<Clock></Clock>, document.getElementById('app'));
