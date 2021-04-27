<template>
  <div>
      {{count}}
  </div>
</template>

<script>
import {mapState,mapMutations,mapActions} from 'vuex'
export default {
    /*组件从store中获取状态属性值的方法：
    （1）可以直接定义计算属性，通过this.$store获取指定的属性值
    （2）当要获取的组件属性值较多时，可以使用vuex提供的mapState
    */
    computed:{
        count(){
            // 直接通过this.store获取全局单例容器进而获取组件的状态属性
            return this.$store.count
        },
        // ...mapState({
        //     //
        //     count:state=>state.count,
        //     countAlias:'count'
        // })
        ...mapState(['count','size'])
    },
    methods:{
        ...mapMutations([
            'increament',// 将this.increment()映射为this.$store.commit('increment')
            'increamentBy'// 将this.incrementBy()映射为this.$store.commit('incrementBy',mount)
        ]),
        ...mapActions([
            'increment',//将this.increment()映射为this.$store.dispatch('increment')
        ]) 
    }
}
</script>

<style>

</style>
