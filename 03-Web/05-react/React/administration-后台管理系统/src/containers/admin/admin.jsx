import './css/admin.less';
import Header from './header/header';
import Home from '../../components/home/home'
import Category from '../category/category'
import Product from '../product/product'
import User from '../user/user'
import Role from '../user/user'
import Bar from '../bar/bar'
import Line from '../line/line'
import Pie from '../pie/pie'

import React, { Component } from 'react'
import { connect } from 'react-redux'
import { Redirect, Route } from 'react-router-dom'
import { createDeleteUserInfoAction } from '../../redux/actions/loginAction'
import { Layout } from 'antd';
const { Footer, Sider, Content } = Layout;


/*
  处理时间格式： day.js 
  react - jsonp[]
*/


class Admin extends Component {
    render() {
        const { isLogin } = this.props.userInfo;
        if (isLogin) {
            return (
                <Layout className='admin'>
                    <Sider className='sider'>Sider</Sider>
                    <Layout className='right'>
                        <Header className='header'>Header</Header>
                        <Content className='content'>
                            <Route path='/admin/home' component={Home}></Route>
                            <Route path='/admin/prod_about/category' component={Category}></Route>
                            <Route path='/admin/prod_about/product' component={Product}></Route>
                            <Route path='/admin/user' component={User}></Route>
                            <Route path='/admin/role' component={Role}></Route>
                            <Route path='/admin/charts/bar' component={Bar}></Route>
                            <Route path='/admin/charts/line' component={Line}></Route>
                            <Route path='/admin/charts/pie' component={Pie}></Route>
                            <Redirect to='/admin/home' />
                        </Content>
                        <Footer className='footer'>Footer</Footer>
                    </Layout>
                </Layout>
            )
        } else {
            // 在render方法里面跳转页面，使用Redirect
            return <Redirect to='/login' />
        }
    }
}

// 一般组件绑定容器组件
export default connect(
    (state) => ({ userInfo: state.userInfo }),
    (dispatch) => {
        return {
            deleteUserInfo: () => { dispatch(createDeleteUserInfoAction()) }
        };
    }
)(Admin);

