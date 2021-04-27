
/*
  (1) 基本数据渲染
*/
var app = new Vue({
  el: '#app',
  data: {
      message: 'Hello Vue!',
      tip: '页面加载于 ' + new Date().toLocaleString()
  }
})

/*
  (2) v-if根据条件进行的数据渲染
*/
var app1 = new Vue({
  el: '#app-3',
  data: {
    seen: true
  },
  /*
    setInterval中使用箭头函数，当前this绑定的是当前作用域的对象
    created: function () { 
         setInterval(()=>{
           let seen = this.seen
           console.log(seen)
           this.seen = !seen
         }, 2000)
    }
    */
  // setInterval中使用普通函数函数，this绑定的是当前执行所在的作用域中调用函数的对象：window
  created: function () {
      let that = this
    //   setInterval(function () {
    //   let seen = that.seen
    //   console.log(seen)
    //   that.seen = !seen
    // }, 2000)
  }
})

/*
   (3) 列表的渲染
*/
var app4 = new Vue({
  el: '#app-4',
  data: {
    todos: [{ text: 'learn JavaScript' }, { text: 'learn Vue' }, { text: 'learn all project' }]
  }
})

/*
  (4) 获取用户的输入
*/
 var app5 = new Vue({
   el: '#app-5',
   data: {
     message: 'Hello Vue.js!'
   },
   methods: {
       reverseMessage: function () {
           // 通过this.$refs对象获取绑定的dom元素
           console.log(this.$refs.input.value);
       this.message = this.message.split('').reverse().join('')
     }
   }
 })

 /*
   (5) 组件化构建
 */

  // 自定义组件
 Vue.component('hua-item',{
    props:['todo'],
    template:'<li>{{todo.text}}</li>'
 })

 var hua = new Vue({
     el:'#app-6',
     data:{
        groceryList:[
            {text:'蔬菜hua'},
            {text:'奶酪hua'},
            {text:'随便什么都无所谓hua'}
        ]
     }
 })

 /*
   (6) 声明周期函数
 */
 var hua = new Vue({
   el: '#app-7',
   data: {
     message:'hello'
   },
   methods: {
     click() { 
       this.message = 'change message!!'
     }
   },
   created: function () {
     console.log('Vue实例被创建之后：created!!');  
   },
   mounted: function () { 
     console.log('Vue实例被挂载完成：mounted');
   },
   updated: function () { 
     // 监控实例是否有内容的更新
     console.log('updated')
   }
 })