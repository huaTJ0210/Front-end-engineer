import React, { Component } from 'react';
import './App.css';

import {Provider} from 'react-redux'
import {createStore} from 'redux'

import AppView from './ToDoApp/components/App'
import todoApp from './ToDoApp/redux/reducers'

let store = createStore(todoApp);
class App extends Component{
   render(){
     return (
       <Provider store={store}>
           <AppView></AppView>
       </Provider>
     );
   }
}

class App1 extends Component {
  constructor(props){
    super(props);
    this.state({
      value:''
    });
    this.handleClick = this.handleClick.bind(this);
  }
  componentDidMount(){
    
  }
  handleClick(){
    // 使用原生的DOM API获取焦点
    this.refs.myInput.focus();
  }
  handleChange(event){
     this.setState({
       value:event.target.value
     });
  }
  render() {
    return (
      <div className="App">
       {/* 如何获取输入框的值*/}
         <input type='text' ref='myInput' onChange={this.handleChange}></input>
         <Hello></Hello>
         <HelloMessage name='runing'></HelloMessage>
         <Clock title='时间表' ></Clock>
         <Toggle></Toggle>
         <Greeting isLogin={false}></Greeting>
         <NumberList numbers={[1,2,3,4,5]}></NumberList>
      </div>
    );
  }
}

// React列表&key
class NumberList extends Component{
  render(){
    let numbers = this.props.numbers;
    const listItem = numbers.map((number,index)=>{
      return (<li key = {index.toString()}>{number}</li>)
    });
    return(
      <ul> {listItem}</ul>
    );
  }
}

// 使用变量来保存待渲染的元素或者组件


// 条件渲染 
class Greeting extends Component{
  render(){
    const isLogin = this.props.isLogin;
    if(isLogin){
      return(
        <UserLogin></UserLogin>
      );
    }else{
      return (
        <RegisterView></RegisterView>
      );
    }
  }
}

// 条件渲染
class UserLogin extends Component{
  render(){
    return(
      <h1>login View</h1>
    );
  }
}

class RegisterView extends Component{
  render(){
    return(
      <h1>register view</h1>
    );
  }
}


class Toggle extends Component{
  constructor(props){
    super(props);
    this.state = {
      isToggle : true
    };
    // 必须绑定this，否则在handleClick中无法使用this
    this.handleClick = this.handleClick.bind(this);
  }

  // 默认类的方法中不会绑定this
  handleClick(){
    this.setState(
      preState => ({
        isToggle : !preState.isToggle
      })
    );
  }

  showName(name){
     if(this.state.isToggle){
       alert(name);
     }
  }

  render(){
    return(
      <div>
        <button onClick={this.handleClick}>
        {this.state.isToggle ?'NO':'OFF'}
      </button>
      <button onClick={this.showName.bind(this,'testName')}>
       事件传参
      </button>
      </div>
    );
  }
}


var myStyle = {
  fontSize:22,
  color:'#FF0000'
}

// 自定义一个组件对象
class Hello extends Component{
  render(){
    return(
      <div>
        {/* 自定义样式*/}
        <h1 style = {myStyle}>hello custom Component</h1>
      </div>
    );
  }
}
class HelloMessage extends React.Component{
  render(){
    return(
      <h1>hello,{this.props.name}</h1>
    );
  }
}

class Clock extends Component{
  constructor(props){
     super(props);
     this.state = {
       clock : (new Date()).toLocaleTimeString()
     };
  }

  componentWillMount(){
    // 该函数在render()函数调用之前调用，
  }

  componentDidMount(){
   this.timer = setInterval(()=>{
      this.setState({
        clock : (new Date()).toLocaleTimeString()
      });
    },1000);
  }
   
  componentWillUnmount(){
      this.timer&&clearInterval(this.timer);
  }

  render(){
    return(
      <div>
        <h1>{this.props.title}</h1>
        <h2>现在是{this.state.clock}.</h2>
      </div>
    );
  }
}

export default App;
