import _ from 'lodash';
//import Print from './print';
 
 function component() {
   const element = document.createElement('div');
 
  // lodash，现在通过 script 标签导入
   element.innerHTML = _.join(['Hello', 'webpack'], ' ');
   element.classList.add('hello');
   //element.onclick = Print.bind(null, 'Hello webpack!');
 
   return element;
 }
 
 document.body.appendChild(component());