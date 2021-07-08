import React, { PureComponent } from 'react';
import { Link } from 'react-router-dom';
import { renderRoutes } from 'react-router-config';

export default class About extends PureComponent {
  render() {
    console.log(this.props.history);
    return (
      <div>
        <Link to='/about'>公司历史</Link>
        <Link to='/about/detail'>公司简介</Link>
        <Link to='/about/address'>公司地址</Link>
        <hr />
        {/* <Switch>
          <Route exact path='/about' component={History}></Route>
          <Route path='/about/detail' component={Detail}></Route>
          <Route path='/about/address' component={Address}></Route>
        </Switch> */}
        {renderRoutes(this.props.route.routes)}
      </div>
    );
  }
}

function NoMatch() {
  return (
    <div>
      <h3>404</h3>
    </div>
  );
}
