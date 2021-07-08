import About from '../pages/about';
import Address from '../pages/about/address';
import Detail from '../pages/about/detail';
import History from '../pages/about/history';
import Home from '../pages/home';
import Profile from '../pages/profile';
import Topic from '../pages/topic';

const routes = [
  {
    path: '/',
    exact: true,
    component: Home,
  },
  {
    path: '/about',
    component: About,
    routes: [
      {
        path: '/about',
        exact: true,
        component: History,
      },
      {
        path: '/about/history',
        component: History,
      },
      {
        path: '/about/address',
        component: Address,
      },
      {
        path: '/about/detail',
        component: Detail,
      },
    ],
  },
  {
    path: '/profile',
    component: Profile,
  },
  {
    path: '/topic',
    component: Topic,
  },
];

export default routes;
