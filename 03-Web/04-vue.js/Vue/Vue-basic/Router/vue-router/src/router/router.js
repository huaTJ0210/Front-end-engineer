import Vue from 'vue'
import VueRouter from 'vue-router'

// (1) 路由组件
import HomePage from '../components/HomePage.vue'
import MinePage from '../components/MinePage.vue'
import MineProfile from '../components/MineProfilePage.vue'
import MinePosts from '../components/MinePostsPage.vue'
import UserPage from '../components/UserPage.vue'
import UserPost from '../components/UserPost.vue'

// （1-1）路由懒加载:
//import UserProfile from '../components/UserProfile.vue'
const UserProfile = () => import('../components/UserProfile.vue')

Vue.use(VueRouter)

// (2) 定义路由
const routes = [
  {
    // 重定向
    path:'',redirect:'/home'
  },
  { path: '/', name: 'home', component: HomePage },
  { path: '/home', name: 'home', component: HomePage },
  { path: '/mine', name: 'mine', component: MinePage },
  { path: '/mine/profile', name: 'profile', component: MineProfile },
  { path: '/mine/posts', name: 'posts', component: MinePosts },
  {
    path: '/user',
    component: UserPage,
    children: [
      {
        path: 'profile',
        name: 'profile',
        component: UserProfile
      },
      {
        path: 'post',
        name: 'post',
        component: UserPost
      }
    ]
  }
]

// (3) 创建router实例，传入‘routes’配置
const router = new VueRouter({ routes })

// (4)全局前置路由守卫
router.beforeEach((to, from, next) => {
  //1、to：Route即将进入的目标 路由对象
  //2、from:Route当前导航正要离开的路由
  //3、next:Function:执行效果依赖next方法调用参数
   console.log(from.name)
  // if (to.name !== 'login') {
  //   next({ name: 'login' })
  // } else {
  //   next()
  // }
  next()
})

export default router
