import React from 'react';

import { incrementAction } from './store/actionCreators';
import { connect } from './utils/connect';

function Home(props) {
 
  return (
    <div>
      <h2>当前计数:{props.counter}</h2>
      <button
        onClick={() => {
          props.increment();
        }}
      >
        +1
      </button>
    </div>
  );
}

function mapStateToProps(state) {
  return {
    counter: state.counter,
  };
}
function mapDispatchToProps(dispatch) {
  return {
    increment: () => {
      dispatch(incrementAction());
    },
  };
}

export default connect(mapStateToProps, mapDispatchToProps)(Home);
