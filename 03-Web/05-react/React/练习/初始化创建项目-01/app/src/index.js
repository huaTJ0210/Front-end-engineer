import React from 'react' // 创建组件、声明周期
import ReactDOM from 'react-dom' // 把创建好的组件和虚拟DOM放到页面展示

/*
  受控组件
  非受控组件：是否自动将状态维护到state
*/
class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      todoList: [
        '吃饭',
        '学习',
        '睡觉'
      ]
    };
  }

  // 组件挂载完成后出发render()函数执行完
  componentDidMount() {
    console.log('----componentDidMount--');
  }

  // 已过期 - 组件将要挂载时
  // componentWillMount() { 
  //   console.log('----componentWillMount--');
  // }

  // 作用和：componentWillMount、componentWillUpdate 一样
  static getDerivedStateFromProps(props, state) {
    // 参数是当前的props和最新的state
    console.log('----getDerivedStateFromProps--');
    return null;
  }

  // shouldComponentUpdate 返回true 会触发 -- 已过期
  // componentWillUpdate() { 
  //   console.log('----componentWillUpdate--');
  // }

  // 介于 render 和 componentDidUpdate
  getSnapshotBeforeUpdate(props, state) {
    // props :
    // state :
    console.log('----getSnapshotBeforeUpdate--');
    return 'li'
  }

  // render执行完毕会触发
  componentDidUpdate(props, state, data) {
    // data from  getSnapshotBeforeUpdate : li
    console.log('----componentDidUpdate--');
  }

  // this.setState()调用会触发
  shouldComponentUpdate() {
    console.log('----shouldComponentUpdate--');
    return true
  }


  // 组件将会被移除时
  componentWillUnmount() {
    console.log('----componentWillUnmount--');
  }


  addTodo = (data) => {
    let { todoList } = this.state;
    todoList.unshift(data);
    this.setState({
      todoList: todoList
    });
  }

  render() {
    let { todoList } = this.state;
    console.log('----render-----');
    let count = todoList.length;
    return (
      <div>
        <h3>Todo List</h3>
        <Add addTodo={this.addTodo} count={count} />
        <TodoList todoList={todoList} />
      </div>
    )
  }
}

class Add extends React.Component {
  addTodo = () => {
    let todo = this.refs.input.value;
    if (todo.trim() == "") return;
    this.props.addTodo(todo);
    this.refs.input.value = "";
  }
  // 首次加载不刷新，props改变时才调用 -- 废弃
  componentWillReceiveProps() {
    console.log('--##add--componentWillReceiveProps--');
  }
  render() {
    let { count } = this.props;
    return (
      <div>
        <input type='text' ref='input'></input>
        <button onClick={this.addTodo}>Add#{count}</button>
      </div>
    );
  }
}
class TodoList extends React.Component {
  render() {
    let { todoList } = this.props;
    return (
      <ul>
        {
          todoList.map((item, index) => <li key={index}>{item}</li>)
        }
      </ul>
    )
  }
}

ReactDOM.render(<App></App>, document.getElementById('app'));
