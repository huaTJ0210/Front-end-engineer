import React from 'react';
import { Link, Switch, Route, useParams } from 'react-router-dom';

/*
 使用useParams获取URLParams
*/
export default function Profile() {
  return (
    <div>
      <ul>
        <li>
          <Link to='/profile/netfix'>Netfix</Link>
        </li>
        <li>
          <Link to='/profile/ali'>Ali</Link>
        </li>
        <li>
          <Link to='/profile/mt'>MeiTuan</Link>
        </li>
      </ul>
      <Switch>
        <Route path='/profile/:id' component={Child}></Route>
      </Switch>
    </div>
  );
}

function Child() {
  let { id } = useParams();
  return (
    <div>
      <h3>ID:{id}</h3>
    </div>
  );
}
