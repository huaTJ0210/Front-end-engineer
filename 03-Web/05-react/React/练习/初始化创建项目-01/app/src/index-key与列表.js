import React from 'react' // 创建组件、声明周期
import ReactDOM from 'react-dom' // 把创建好的组件和虚拟DOM放到页面展示

/*
  列表与key
*/
class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      isCheck: false,
      numbers: [1, 2, 3, 4, 5, 6]
    };


  }
  render() {
    // 条件渲染
    return (
      this.state.numbers.map((item, index) => {
        return <li key={index}>{item}</li>
      })
    )
  }
}

ReactDOM.render(<Clock></Clock>, document.getElementById('app'));
