const EventEmitter = require('events');

const eventEmitter = new EventEmitter();

eventEmitter.on('eventName', (params) => {
  console.log(params);
});

eventEmitter.emit('eventName', { name: 'li' });

// （1）once:添加单次监听

// (2)removeListener()/off():移除监听

// (3)removeAllListener(); 移除所有的监听

