import _ from 'lodash';
import './style.css';
import Icon from './icon.jpg';

import printMe from './print.js';

function component() {
  const element = document.createElement('div');
  
  const btn = document.createElement('button');
  element.innerHTML = _.join(['Hello', 'webpack'], ' ');
  btn.innerHTML = "click me and check the console"
  btn.onclick = printMe;
  element.appendChild(btn);

  // lodash（目前通过一个 script 引入）对于执行这一行是必需的
  
  element.classList.add('hello');
  // const myIcon = new Image();
  // myIcon.src = Icon;
  // element.appendChild(myIcon);
  return element;
}

document.body.appendChild(component());