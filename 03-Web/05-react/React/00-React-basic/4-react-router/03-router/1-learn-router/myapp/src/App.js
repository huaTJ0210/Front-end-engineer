import './App.css';

import routes from './router';
import { Link } from 'react-router-dom';
import { renderRoutes } from 'react-router-config';

function App() {
  return (
    <div className='App'>
      <Link to='/'>首页</Link>
      <Link to='/about'>关于</Link>
      <Link to='/profile'>我的</Link>
      <Link to='/topic'>主题</Link>
      <hr></hr>
      {/* <Route exact path='/' component={Home}></Route>
      <Route path='/about' component={About}></Route>
      <Route path='/profile' component={Profile}></Route>
      <Route path='/topic' component={Topic}></Route> */}
      {renderRoutes(routes)}
    </div>
  );
}

export default App;
