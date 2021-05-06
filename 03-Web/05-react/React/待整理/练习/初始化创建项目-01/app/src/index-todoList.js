import React from 'react' // 创建组件、声明周期
import ReactDOM from 'react-dom' // 把创建好的组件和虚拟DOM放到页面展示


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
  addTodo = (data) => {
    let { todoList} = this.state;
    todoList.unshift(data);
    this.setState({
      todoList: todoList
    });
  }

  render() {
    let { todoList } = this.state;
    console.log('----render-----');
    console.log(todoList);
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
