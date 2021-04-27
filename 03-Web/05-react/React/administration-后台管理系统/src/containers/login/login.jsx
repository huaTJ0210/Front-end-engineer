import React, { Component } from 'react'

import { connect } from 'react-redux'
import { createSaveUserInfoAction } from '../../redux/actions/loginAction'
import { Redirect } from 'react-router-dom'

import './css/login.less'
import loginLogo from './img/logo.png' // 图片引用方法

import { Form, Input, Button, Checkbox } from 'antd';
import { UserOutlined, LockOutlined } from '@ant-design/icons';
import qs from 'querystring'
/*
  minireset.css // 重置默认样式

  // 请求跨域：配置webpack中的代理
  proxy: '请求域名'

  axios:默认请求数据格式为json
  querystring：

  // 进度条： npm install nprogress  
  // 样式： 'nprogress/nprogress.css'
  
*/
class Login extends Component {
    onFinish = values => {
        console.log('Received values of form: ', values);
        // 1、输入数据判断
        // 2、开始进行登录请求
        const { username, password } = values;
        qs.stringify({ username, password }); // username='1323'&password='124324'

        // 4 服务器返回的数据保存到store（redux）
        this.props.saveUserInfo({ user: { userName: 'admin' }, token: 'fefqefqe', isLogin: true });
        // 5 请求成功后跳转
        this.props.history.replace('/admin');
    };
    render() {
        const { isLogin } = this.props
        if (isLogin) {
            return <Redirect to='/admin'></Redirect>
        } else {
            return (
                <div className='login'>
                    <header className='header'>
                        <img src={loginLogo} alt=''></img>
                        <h1>后台管理中心</h1>
                    </header>
                    <section>
                        <h1>用户登录</h1>
                        <Form
                            name="normal_login"
                            className="login-form"
                            initialValues={{
                                remember: true,
                            }}
                            onFinish={this.onFinish}
                        >
                            <Form.Item
                                name="username"
                                rules={[
                                    {
                                        required: true,
                                        message: '请输入用户名!',
                                    },
                                ]}
                            >
                                <Input prefix={<UserOutlined className="site-form-item-icon" />} placeholder="请输入用户名" />
                            </Form.Item>
                            <Form.Item
                                name="password"
                                rules={[
                                    {
                                        required: true,
                                        message: 'Please input your Password!',
                                    },
                                ]}
                            >
                                <Input
                                    prefix={<LockOutlined className="site-form-item-icon" />}
                                    type="password"
                                    placeholder="请输入密码" />
                            </Form.Item>
                            <Form.Item>
                                <Form.Item name="remember" valuePropName="checked" noStyle>
                                    <Checkbox>记住密码</Checkbox>
                                </Form.Item>
                                <a className="login-form-forgot" href="">忘记密码 </a>
                            </Form.Item>
                            <Form.Item>
                                <Button type="primary" htmlType="submit" className="login-form-button">登录</Button>
                                <a href="">注册!</a>
                            </Form.Item>
                        </Form>
                    </section>
                </div>
            )
        }

    }
}

export default connect(
    (state) => ({ isLogin: state.userInfo.isLogin }),
    (dispatch) => {
        return {
            saveUserInfo: (value) => { dispatch(createSaveUserInfoAction(value)) }
        };
    }
)(Login);
