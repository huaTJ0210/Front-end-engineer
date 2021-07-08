import React from 'react';
import { Redirect } from 'react-router-dom';

import HZDiscover from '../pages/discover';
import HZRecommend from '../pages/discover/c-pages/recommend';
import HZRanking from '../pages/discover/c-pages/ranking';
import HZSongs from '../pages/discover/c-pages/songs';
import HZDjradio from '../pages/discover/c-pages/djradio';
import HZArtist from '../pages/discover/c-pages/artist';
import HZAlbum from '../pages/discover/c-pages/album';
// import HZPlayer from "../pages/player";

import HZFriend from '../pages/friend';
import HZMine from '../pages/mine';

// const HZDiscover = React.lazy(_ => import("../pages/discover"));
// const HZRecommend = React.lazy(_ => import("../pages/discover/c-pages/recommend"));
// const HZRanking = React.lazy(_ => import("@/pages/discover/c-pages/ranking"));
// const HZSongs = React.lazy(_ => import("@/pages/discover/c-pages/songs"));
// const HZDjradio = React.lazy(_ => import("@/pages/discover/c-pages/djradio"));
// const HZArtist = React.lazy(_ => import("@/pages/discover/c-pages/artist"));
// const HZAlbum = React.lazy(_ => import("@/pages/discover/c-pages/album"));
// const HYPlayer = React.lazy(_ => import("../pages/player"));

// const HZFriend = React.lazy(_ => import("../pages/friend"));
// const HZMine = React.lazy(_ => import("../pages/mine"));

// eslint-disable-next-line import/no-anonymous-default-export
export default [
  {
    path: '/',
    exact: true,
    render: () => <Redirect to='/discover' />,
  },
  {
    path: '/discover',
    component: HZDiscover,
    routes: [
      {
        path: '/discover',
        exact: true,
        render: () => <Redirect to={'/discover/recommend'} />,
      },
      {
        path: '/discover/recommend',
        component: HZRecommend,
      },
      {
        path: '/discover/ranking',
        component: HZRanking,
      },
      {
        path: '/discover/songs',
        component: HZSongs,
      },
      {
        path: '/discover/djradio',
        exact: true,
        component: HZDjradio,
      },
      {
        path: '/discover/artist',
        component: HZArtist,
      },
      {
        path: '/discover/album',
        component: HZAlbum,
      },
      // {
      //   path: "/discover/player",
      //   component: HYPlayer
      // }
    ],
  },
  {
    path: '/friend',
    component: HZFriend,
  },
  {
    path: '/mine',
    component: HZMine,
  },
];
