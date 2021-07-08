import React, { useState, useLayoutEffect, useEffect } from 'react';

export default function UseLayoutEffect() {
  const [count, setCount] = useState(0);

  //Dom元素已经绘制显示在屏幕后执行useEffect
  useEffect(() => {
    if (count === 0) {
      setCount(Math.random * 100);
    }
  }, [count]);

  // 在Dom元素绘制显示在屏幕之前执行useLayoutEffect，会阻塞DOM的绘制
  useLayoutEffect(() => {
    if (count === 0) {
      setCount(Math.random * 100);
    }
  }, [count]);

  return (
    <div>
      <p>count:{count}</p>
      <button onClick={setCount(0)}></button>
    </div>
  );
}
