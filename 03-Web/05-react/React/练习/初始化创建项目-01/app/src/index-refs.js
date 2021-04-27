import React from 'react' // 创建组件、声明周期
import ReactDOM from 'react-dom' // 把创建好的组件和虚拟DOM放到页面展示

/*
  props:
  限制属性是否必须传递

  + 需要安装propstype
*/
class Person extends React.Component { 
  // 设置属性的数据类型
  static propTypes = {
    name: PropTypes.string.isRequired,
    age: PropTypes.number,
    sex: PropTypes.string
  }
  // 设置属性默认值
  static defaultProps = {
    age: 18,
    sex:'man'
  }


  constructor(props) { 
    super(props);

  }

  // ref的使用 [新语法] "专人专用"
  myRef = React.createRef();// 创建一个容器， 绑定input
  myButtonRef = React.createRef();
  onClickHandle = (event) => { 
    var el = event.target;
    let value = this.refs.text1.value;
    // 获取当前的元素
    this.myRef.current.value;
  }
  render() { 
    let { name, age, sex } = this.props;
    return (
      <div>
        <input type="text" ref={this.myRef}></input>
        <button onClick={this.onClickHandle} ref={myButtonRef}>点击</button>
        <input type="text" placeholder="失去焦点提示"></input>
      </div>
    )
  }
}
let person = { name: 'li', sex: 'woman' };
// react + bael 完成了对象的遍历 ...person
ReactDOM.render(<Person {...person}></Person>, document.getElementById('app'));
