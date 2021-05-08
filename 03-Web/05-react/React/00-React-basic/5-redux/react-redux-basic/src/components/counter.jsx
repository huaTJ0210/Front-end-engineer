import React, { Component } from 'react'
import '../App.css'

export default class Counter extends Component {

    increment = () => {
        const value = this.refs.select.value;
        this.props.increment(value);

    }
    decrement = () => {
        const value = this.refs.select.value;
        this.props.decrement(value);

    }
    asyncIncrement = () => {
        const value = this.refs.select.value;
        this.props.asyncIncrement(value, 1000);
    }
    render() {
        const { count } = this.props.state;

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
