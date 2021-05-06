// import React from 'react';
// 首页 
// Component should be written as a pure functiones
// const Home = props => {
//     const { name } = props;

//     return (<div>
//         home {name}
//     </div>);
// }

// export default Home;

import React, { Component } from 'react';

class home extends Component {
    constructor(props) {
        super();
    }

    render() {
        return (
            <div>
                home
            </div>
        );
    }
}

export default home;