import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

const Home = () => import('@/views/home/home.vue')
const Cart = () => import('@/views/cart/cart.vue')
const Catagory = () => import('@/views/catagory/catagory.vue')
const Profile = () => import('@/views/profile/profile.vue')

const routes = [
  {
    path:'',redirect:'/home'
  },
  {
    path:'/home',component:Home,name:'home'
  },
  {
    path:'/cart',component:Cart,name:'cart'
  },
  {
    path:'/catagory',component:Catagory,name:'catagory'
  },
  {
    path:'/profile',component:Profile,name:'profile'
  },
];

const router = new VueRouter({ routes, mode: 'history' });

/*
  解决router连续push相同的地址导致错误未捕获的问题
*/ 
const originalPush = VueRouter.prototype.push
VueRouter.prototype.push = function push(location) {
  return originalPush.call(this, location).catch(err => console.log(err))
}

export default router;