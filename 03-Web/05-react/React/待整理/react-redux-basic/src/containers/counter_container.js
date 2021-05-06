import Counter from '../components/counter.jsx'
import { connect } from 'react-redux'

import { incrementAction, decrementAction,asyncIncrementAction } from '../redux/actions_creator'


/*
   (1) 安装 react-redux
   （2）安装 redux-thunk: 提供dispatch的异步分发能力
*/

function mapStateToProps(state) {
    return { state: state }
}
function mapDispatchToProps(dispatch) {
    return {
        increment: (value) => {
            dispatch(incrementAction(value))
        },
        decrement: (value) => {
            dispatch(decrementAction(value))
        },
        asyncIncrement: (value,delay) => {
            dispatch(asyncIncrementAction(value,delay))
        }
    }
}


export default connect(mapStateToProps, mapDispatchToProps)(Counter)