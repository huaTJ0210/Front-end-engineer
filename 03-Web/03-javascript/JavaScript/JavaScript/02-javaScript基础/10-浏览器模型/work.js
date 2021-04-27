self.postMessage('meesage from work Thread');
self.onmessage = function (event) { 
  console.log(event.data);
};