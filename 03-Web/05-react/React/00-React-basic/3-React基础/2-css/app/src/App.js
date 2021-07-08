import './App.css';

import styled from 'styled-components';

// 创建了一个Title的组件，它渲染的时候会创建一个带有如下样式的h1标签，
const Title = styled.h1`
  font-size: 1.5em;
  text-align: center;
  color: palevioletred;
`;
//
const Wrapper = styled.section`
  padding: 4em;
  background-color: papayawhip;
`;

const Button = styled.button`
  /*可以根据组件的props设置样式*/
  background-color: ${(props) => (props.primary ? 'white' : 'palevioletred')};
  font-size: 1em;
  margin: 1em;
  padding: 0.25em 1em;
  border: 1px solid palevioletred;
  border-radius: 3px;
`;

// 创建一个继承自Button的组件，只需要将要继承的组件作为styled()函数的参数即可
// styled()函数是一个工厂方法，任何组件都可以当做参数传入，然后返回一个装饰后的新组件
const TomatoButton = styled(Button)`
  color: tomato;
  border-color: tomato;
`;

// 伪元素、伪选择器和嵌套
const Thing = styled.div`
  color: blue;
  &:hover {
    color: red; // 当前Thing被鼠标悬停
  }
  /* & ~ & {
    background-color: tomato; // 作为Thing的兄弟组件，但并不一定是直接相邻的
  }
  & + & {
    background-color: pink; // Thing组件相邻的Thing组件
  } */
  &.something {
    background-color: orange; // Thing组件附加的.something类样式
  }
  .something-else & {
    border: 1px solid red; // .something类样式下的Thing组件
  }
`;

function App() {
  return (
    <div>
      <Wrapper>
        <Title>Hello World!!</Title>
        <Button>Normal</Button>
        <Button primary>Primary</Button>
        <TomatoButton primary>TomatoButton</TomatoButton>
      </Wrapper>
      <br></br>
      <Thing>123</Thing>
      <Thing>abc</Thing>
      <p>xyz</p>
      <Thing>abc</Thing>
      <Thing className='something'>something</Thing>
      <div className='something-else'>
        <Thing>something-else</Thing>
      </div>
    </div>
  );
}

export default App;
