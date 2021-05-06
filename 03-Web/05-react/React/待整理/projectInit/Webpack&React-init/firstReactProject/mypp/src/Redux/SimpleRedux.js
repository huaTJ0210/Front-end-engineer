import React, { Component } from 'react';

import {createStore} from 'redux'


class SimpleRedux extends Component {
   
    constructor(props){
        super(props);
        this.state={
            userName : 'default'
        }
        this.changeUserName = this.changeUserName.bind(this);
    }
    
    componentDidMount(){
        //    var store = createStore(this.simpleReducer);
        //    console.log(store.getState().user.name);
        // var user = this.user;
        // var project = this.project;
        // var rootReducer = combineReducers({
        //     user,
        //     project
        // });
        // var store = createStore(rootReducer);
        // console.log(store.getState());
     
        this.store = createStore(this.changeUserNameReducer);
        
        this.store.subscribe(()=>{
            console.log(this.store.getState().userName);
             this.setState({
                 userName:this.store.getState().userName
             });
        });

    }

    changeUserNameReducer(state={userName:''},action){
      if(action.type == 'CHANGE_NAME'){
        state.userName = action.name;
      }
        return state;
    }

    changeUserName(){
            let userName = this.refs.inputName.value;
            // dispatch action
            this.store.dispatch({
                type:'CHANGE_NAME',
                name:userName
            });
    }

    render() {
        return (
            <div>
                <input ref='inputName' type='text' placeholder='input something'></input>
                <button onClick={this.changeUserName}>change name</button>
                <p>{this.state.userName}</p>
            </div>
        );
    }


    simpleReducer(state ={},action){
        return {
            user:{
                name:'redux'
            }
        }
      }
  
     user(state={name:'redux'},action){
       switch(action.type){
           case 'CHANGE_NAME':
           return{
               ...state,
               name:action.name
           }
       }
       return state
     }
  
     project(state = {name:'min-react'},action){
         switch(action.type){
             case 'CHANGE_NAME':
             return {
                 ...state,
                 name:action.name
             }
         }
         return state
     }
}

export default SimpleRedux;