<template>
  <div id="app">
    <router-view></router-view>
    <MainTabbar></MainTabbar>
  </div>
</template>

<script>
import MainTabbar from '@/components/MainTabbar';
export default {
  name: 'App',
  components: {
    MainTabbar,
  },
};
</script>

<style scoped>
@import './assets/css/base.css';
</style>
