import React, { Component} from 'react';

import PubSub from 'pubsub-js'

/*
  PubSubJS: 发布（publish）与订阅 （subscribe）
  + npm install pubsub-js --save 

*/ 


export default class App extends Component { 

  componentDidMount() { 
    // 订阅消息
    PubSub.subscribe('msgName', (msg,data) => {
      console.log(data.para);
    });
  }
 // 消息发布
  onClick = () => { 
    PubSub.publish('msgName', {para:'123'});
  }

  render() { 
    return (
      <div>
        <button onClick={this.onClick}>发布消息</button>
      </div>
    )
  }
}
