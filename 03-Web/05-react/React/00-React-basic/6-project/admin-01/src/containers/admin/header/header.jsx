
import React, { Component } from 'react'
import { Button, Modal } from 'antd'
import { withRouter } from 'react-router-dom'
import dayjs from 'dayjs'

import { connect } from 'react-redux'
import { createDeleteUserInfoAction } from '../../../redux/actions/loginAction'
import {
    FullscreenOutlined,
    ExclamationCircleOutlined
} from '@ant-design/icons';

import './css/header.less';

const { confirm } = Modal;

/*
   全屏幕显示库
   screenfull
*/

class Header extends Component {

    state = {
        date: dayjs().format('YYYY年 MM月DD日 HH:mm:ss')
    }

    componentDidMount() {
        this.timerID = setInterval(() => {
            this.setState({
                date: dayjs().format('YYYY年 MM月DD日 HH:mm:ss')
            });
        }, 1000);
    }

    componentWillMount() {
        clearInterval(this.timerID)
    }


    // 退出登录
    logout = () => {
        this.showConfirm();
    }

    showConfirm() {
        confirm({
            title: '提示',
            icon: <ExclamationCircleOutlined />,
            content: '您确定要退出登录吗？',
            cancelText: '取消',
            okText: '确认',
            onOk: () => {
                this.props.deleteUserInfo()
            },
            onCancel() {

            },
        });
    }

    render() {
        const { user } = this.props.userInfo;
        const { date } = this.state;
        return (
            <header className='adminheader'>
                <div className='header-top'>
                    <Button size='small'>
                        <FullscreenOutlined />
                    </Button>
                    <span className='userName'>欢迎，{user.userName}</span>
                    <Button type='link' size='small' onClick={this.logout}>退出登录</Button>
                </div>
                <div className='header-bottom'>
                    <div className='header-bottom-left'>
                        {this.props.location.pathname}
                    </div>
                    <div className='header-bottom-right'>
                        {date}
                        <img src='http://api.map.baidu.com/images/weather/day/qing.png' alt='天气信息'></img>
                        晴 温度： -2℃~5℃
                    </div>
                </div>
            </header>
        )
    }
}


//  2、withRouter : 将非路由组件包装为路由组件
export default withRouter(
    // 1、将UI组件与容器组件绑定，使得UI组件可以与redux进行通信
    connect(
        state => ({ userInfo: state.userInfo }),
        (dispatch) => {
            return {
                deleteUserInfo: () => { dispatch(createDeleteUserInfoAction()) }
            }
        }
    )(Header)
)
