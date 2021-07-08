import React from 'react';
import styled, { keyframes } from 'styled-components';

const Input = styled.input.attrs((props) => ({
  type: 'text',
  size: props.size || '1em',
}))`
  color: palevioletred;
  font-size: 1em;
  border: 2px solid palevioletred;
  border-radius: 3px;
  margin: ${(props) => props.size};
  padding: ${(props) => props.size};
`;

// 动画
const roate = keyframes`
  from{
    transform:rotate(0deg);
  }
  to{
    transform: rotate(360deg);
  }
`;

const Rotate = styled.div`
  display: inline-block;
  animation: ${roate} 2s linear infinite;
  padding: 2rem 1rem;
  font-size: 1.2rem;
`;

export default function Attr() {
  return (
    <div>
      <Input placeholder='A small text input'></Input>
      <Rotate>&lt; 12 &gt;</Rotate>
    </div>
  );
}
