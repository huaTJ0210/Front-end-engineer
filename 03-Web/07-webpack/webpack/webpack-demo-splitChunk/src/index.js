import _ from 'lodash';

function component() {
  const element = document.createElement('div');

  element.innerHTML = _.join(['Hello', 'webpack'], ' ');

  // lodash（目前通过一个 script 引入）对于执行这一行是必需的
  
  element.classList.add('hello');

  return element;
}

document.body.appendChild(component());