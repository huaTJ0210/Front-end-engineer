import React, { Component } from 'react'
import './App.css'

import { incrementAction, decrementAction } from './redux/actions/actions_creator'

/*
  （1） 安装redux ： npm install redux
*/

export default class App extends Component {

  increment = () => {
    const value = this.refs.select.value;
    this.props.store.dispatch(incrementAction(value));
  }
  decrement = () => {
    const value = this.refs.select.value;
    this.props.store.dispatch(decrementAction(value));
  }
  asyncIncrement = () => {
    const value = this.refs.select.value;
    setTimeout(() => {
      this.props.store.dispatch(incrementAction(value));
    }, 1000);
  }
  render() {
    // store中注入了多个reducers
    // 因此获取值的时候需要getState()返回的对象中根据key来获取组件的state
    const { count } = this.props.store.getState().counter;
    console.log('app' + this.props.store.getState().counter);
    return (
      <div className="App">
        <h3>当前显示值：{count}</h3>
        <select className='select' ref='select'>
          <option value='1'>1</option>
          <option value='2'>2</option>
          <option value='3'>3</option>
        </select>
        <button onClick={this.increment} className='increment'>increment</button>
        <button onClick={this.decrement} className='increment'>decrement</button>
        <button onClick={this.asyncIncrement} className='increment'>asyncIncrement</button>
      </div>
    )
  }
}
