import React, { Component } from 'react'

export default class App extends Component {

  constructor(props) {
    super(props);
    this.state = {text: "显示数据",text1:'数据'};
    this.handleClick = this.handleClick.bind(this);
    this.openConsole = this.openConsole.bind(this);
  }

  componentDidMount() { 
    // 注册需要app端调用的业务方法，具体执行在回调函数中执行具体业务【比如ajax请求】
    try {
      var self = this; 
      React.$bridge.registerHandler('appCallJS', function (data, responseCallback) {
        console.log("JS Echo called with:", data)
        self.setState({
          text1: data.name
        });
        responseCallback({ name: 'from js callBack data' });
      });
    } catch { 

    }
  }

  handleClick() {
    /*
       web调用原生方法
       bqJSBridgeService接收三个参数：
       funcName: 原生方法名，
       funcParmas: 原生方法参数，
       callbackFunc:原生调用js的回调函数
    */ 
    var self = this; //注意回调中若要使用this，需要提前绑定给临时变量，不然this获取不到
    React.$bqJSBridgeService('firstPageClick', { name: 'li' }, function(data) {
      self.setState({
        text: data.name
      });
    });
  }

  openConsole() { 
    /*打开原生控制面板即可修改app加载入口文件的地址如：http://localhost:3000 */
    React.$bqJSBridgeService('openConsole');
  };

  render() {
    return (
      <div>
        <button onClick={this.handleClick}>获取原生数据</button>
        <p>{this.state.text}</p>
        <p>{this.state.text1}</p>
        <button onClick={this.openConsole}>打开控制面板修改入口地址</button>
      </div>
    )
  }
}
