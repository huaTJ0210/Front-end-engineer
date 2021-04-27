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
  render() { 
    let { name, age, sex } = this.props;
    return (
      <ul>
        <li>姓名：{name}</li>
        <li>年龄：{age}</li>
        <li>性别：{sex}</li>
      </ul>
    )
  }
}
let person = { name: 'li', sex: 'woman' };
// react + bael 完成了对象的遍历 ...person
ReactDOM.render(<Person {...person}></Person>, document.getElementById('app'));
