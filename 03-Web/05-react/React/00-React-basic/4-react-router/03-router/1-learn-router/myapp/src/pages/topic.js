import React from 'react';
import {
  Link,
  useParams,
  useRouteMatch,
  Route,
  Switch,
} from 'react-router-dom';

export default function Topic() {
  let { path, url } = useRouteMatch();
  return (
    <div>
      <ul>
        <li>
          <Link to={`${url}/rendering`}>RenderWithReact</Link>
        </li>
        <li>
          <Link to={`${url}/component`}>Components</Link>
        </li>
        <li>
          <Link to={`${url}/props`}>Props</Link>
        </li>
      </ul>
      <Switch>
        <Route exact path={path}>
          <h3>please select a topic</h3>
        </Route>
        <Route path={`${path}/:id`} component={TopicCpn}></Route>
      </Switch>
    </div>
  );
}

function TopicCpn() {
  let { id } = useParams();
  return (
    <div>
      <h2>{id}</h2>
    </div>
  );
}
