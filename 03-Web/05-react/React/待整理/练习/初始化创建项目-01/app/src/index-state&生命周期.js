import React from 'react' // 创建组件、声明周期
import ReactDOM from 'react-dom' // 把创建好的组件和虚拟DOM放到页面展示

class Clock extends React.Component {
  constructor(props) {
    // this 组件类的实例对象
    super(props);
    this.state = {
      date: new Date(),
      isWorld:false
    }
    // 将click中的this赋值为当前组件类的实例对象
    this.click = this.click.bind(this);
  }
  // 生命周期函数
  componentDidMount() {
    this.timer = setInterval(() => this.tick(), 1000);
  }
  componentWillUnmount() {
    clearInterval(this.timer);
  }

  tick() {
    this.setState({
      date: new Date()
    });
  }

  click() { 
    // 当前this被react设置为undefined
    // 修改state中的值必须 使用setState方法
    this.setState(state=>{
      isWorld:!state.isWorld
    });
  }

  testFunc = () => { 
    // 箭头函数this没有指向，需要向上层查找
    console('testFunc');
  }

  render() {
    return (
      <div>
        <h1 onClick={this.click}>Hello,{isWorld ? 'world' : 'test'}</h1>
        <h2>It is {this.state.date.toLocaleTimeString()}.</h2>
      </div>
    );
  }
}

ReactDOM.render(<Clock></Clock>, document.getElementById('app'));
