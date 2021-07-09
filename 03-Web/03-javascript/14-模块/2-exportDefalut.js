// 默认导出，在导入的时候会重新命名

function bar() {}

/*
  export default 接收的是一个表达式，如果之后给bar赋予其他值，不会影响到导出
*/
export default bar;

/*
  默认导出绑定实际上绑定到了bar上，而不是bar当前代表的值
*/
export { bar as default };
