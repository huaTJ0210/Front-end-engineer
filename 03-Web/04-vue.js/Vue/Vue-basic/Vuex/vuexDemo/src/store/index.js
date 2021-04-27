import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex);

export default new Vuex.Store({
    state: {
        count: 0,
        size: 1,
        age: 18,
        obj: {

        },
        todos: [
            
        ]
    },
    getters: {
        // (1)对store中的状态值进行二次加工后再返回给组件
        countSize: state => { 
            return state.count + state.size
        },
        getCountById: (state) => (id) => { 
            return state.todos.find(todo=>todo.id===id);
        }
    },
    mutations: {
        increment(state) { 
            state.count++
            // 新对象替换老对象,利用对象展开运算符
            state.obj = {...state.obj,newProp:123}
        },
        // 提交的mutation携带参数
        add(state, n) { 
            state.count += n
        }
    }, actions: {
        /*
        increment(context) { 
            context.commit('increment')
        }*/
        // 参数解构
        increment({ commit }) { 
            return new Promise((resolve, reject) => { 
                setTimeout(() => { 
                    commit('increment');
                    resolve()
                },1000)
            })
        }
    }
});

