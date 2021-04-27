import React from 'react' // 创建组件、声明周期
export default class HelloWorld extends React.Component {
    constrcutor() { 

    }
    // 实例方法:挂载在原型对象的上
    say() { 
        console.log('say!!');
    }
    // 静态方法
    static show() { 
        
    }
    // 静态属性：在class内部被static修饰
    static info = '';
    render() {
        return <h3>{this.props.name + this.props.age}  </h3>
    };
}