<template>
  <div>
      {{  count }} + {{ age }} + {{size}} + {{countSize}}
  </div>
</template>

<script>
// 一个组件中需要取出多个状态时，都声明为计算属性则显得多余，
// 可以使用mapState辅助生成计算属性
// import {mapState} from 'vuex'
import {mapGetters,mapMutations,
} from 'vuex'

export default {
  // (0) 直接使用计算属性获取store中的属性
  computed:{
    count (){
      return this.$store.state.count
    },
    size(){
      return this.$store.state.size
    },
    age(){
      return this.$store.state.age
    },
    // countSize(){
    //   return this.$store.getters.countSize
    ...mapGetters([
      'countSize'
    ])
   }
  /*（1）
 computed:mapState({
   count: state => state.count,
   size :state => state.size,
   age :state => state.age,
   // 为了使用this获取局部状态
   countAge(state){
     return state.count + this.$store.state.size
   }
 })*/
 /* （2）当store中存储的属性名称与计算属性名称一致时可以直接传递字符串数组
 computed:mapState([
   'count','size','age'
 ])
 */
/*  （3）mapState函数返回一个对象，可以使用对象展开运算符进行简写
computed:{
  ...mapState(['count','age','size'])
}*/
,methods:{
  // 在组件中使用mutation,同时mutation的操作都是同步的
  ...mapMutations([
    'increment',// 将this.increment()映射为this.$store.commit('increment')
  ]),
  ...mapActions([
    'increment'// 将this.increment()映射为this.$store.dispatch('increment')
  ])
}
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
