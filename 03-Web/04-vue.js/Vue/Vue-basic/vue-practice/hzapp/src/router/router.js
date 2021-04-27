// (1) 导入 vue及vue-router
import Vue from 'vue';
import VueRouter from 'vue-router';

// (2) Vue挂载VueRouter
Vue.use(VueRouter);

// (3)导入组件
import HomePage from '../views/HomePage.vue';

// (4) 定义路由
const routes = [{ path: '/home', name: 'home', component: HomePage }];

// (5) 创建router实例，传入‘routes’配置
const router = new VueRouter({ routes });

// (6)全局前置路由守卫
router.beforeEach((to, from, next) => {
  //1、to：Route即将进入的目标 路由对象
  //2、from:Route当前导航正要离开的路由
  //3、next:Function:执行效果依赖next方法调用参数
  next();
});

export default router;
