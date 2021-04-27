import React, { Component } from 'react';

import { BrowserRouter, NavLink, Route, Switch, Redirect } from 'react-router-dom'

import { About} from './component/about'

/*
  路由组件: react-router-dom
*/
export default class App extends Component { 

  render() { 
    return (
      <div>
        <BrowserRouter>
          <NavLink to=''></NavLink>
        </BrowserRouter>
        <div>
          <BrowserRouter>
            <Switch>
              {
                /* 
                  注意模糊匹配的问题；
                  exact ： 精准匹配
                */
              }
              <Route path='' component={About} exact></Route>
              <Redirect to=''></Redirect>
            </Switch>
          </BrowserRouter>
        </div>
      </div>
    )
  }
}
