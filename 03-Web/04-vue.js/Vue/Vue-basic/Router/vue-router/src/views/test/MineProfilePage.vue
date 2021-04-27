<template>
  <div>
    Profile
    <p>{{ this.$route.params.userid }}</p>
    <button @click="printRoute">打印路由器及路由</button>
  </div>
</template>

<script>
export default {
  methods: {
    printRoute() {
      console.log(this.$route) // 当前组件的路由记录：各种的配置信息
      console.log(this.$router) // router是VueRouter的实例对象。
      this.$router.back()
    }
  }
}
</script>

<style></style>
