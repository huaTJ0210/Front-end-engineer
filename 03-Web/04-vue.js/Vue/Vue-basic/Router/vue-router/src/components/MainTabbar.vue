<!--  -->
<template>
  <div>
    <tab-bar>
      <tab-bar-item path="/home" color="red">
        <template v-slot:normal>
          <img src="@/assets/images/home/home.png" />
        </template>
        <template v-slot:selected>
          <img src="@/assets/images/home/home_selected.png" />
        </template>
        <template v-slot:text>
          <div>首页</div>
        </template>
      </tab-bar-item>
      <tab-bar-item path="/cart" color="red">
        <template v-slot:normal>
          <img src="@/assets/images/home/home.png" />
        </template>
        <template v-slot:selected>
          <img src="@/assets/images/home/home_selected.png" />
        </template>
        <template v-slot:text>
          <div>购物车</div>
        </template>
      </tab-bar-item>
      <tab-bar-item path="/catagory" color="red">
        <template v-slot:normal>
          <img src="@/assets/images/home/home.png" />
        </template>
        <template v-slot:selected>
          <img src="@/assets/images/home/home_selected.png" />
        </template>
        <template v-slot:text>
          <div>分类</div>
        </template>
      </tab-bar-item>
      <tab-bar-item path="/profile" color="red">
        <template v-slot:normal>
          <img src="@/assets/images/home/home.png" />
        </template>
        <template v-slot:selected>
          <img src="@/assets/images/home/home_selected.png" />
        </template>
        <template v-slot:text>
          <div>我的</div>
        </template>
      </tab-bar-item>
    </tab-bar>
  </div>
</template>

<script>
import TabBar from '@/components/tabbar/TabBar';
import TabBarItem from '@/components/tabbarItem/TabBarItem';

export default {
  name: 'MainTabBar',
  components: {
    TabBar,
    TabBarItem,
  },
  data() {
    return {};
  },
  computed: {},
  watch: {},
  methods: {},
  created() {},
  mounted() {},
  updated() {},
  destroyed() {},
  activated() {},
};
</script>
<style scoped></style>
