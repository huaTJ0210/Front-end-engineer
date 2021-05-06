import React from 'react' // 创建组件、声明周期
import ReactDOM from 'react-dom' // 把创建好的组件和虚拟DOM放到页面展示

/*
  事件绑定
*/
class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.message = "test";
    this.state = {
      isCheck: false
    };
    // 为了在回调中使用this，必须绑定 [使用箭头函数可以不用绑定]
    //this.handleClick = this.handleClick.bind(this);

    // 使用箭头函数可以不用绑定：但会造成每次渲染button都会重新创建回调函数
  }

  handleClick(param) {
    console.log(param);
    this.setState(state => ({
      isCheck: !state.isCheck
    }));
    console.log(this.message);
  }
  render() {
    return (
      <div>
        <button onClick={this.handleClick}>绑定事件</button>
      </div>
    );
  }
}

ReactDOM.render(<Clock></Clock>, document.getElementById('app'));
