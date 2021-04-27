import axios from 'axios'
import projectConfig from '../config/index'
import qs from 'querystring'
import { message } from 'antd'

import store from '../redux/store'
import { createDeleteUserInfoAction} from '../redux/actions/loginAction'

const instance = axios.create({
    baseURL: projectConfig.BASEURL,// baseURL
    timeout: 10000, // 请求超时时间
    // headers: { 'X-Custom-Header': 'foobar' } //  HTTP 请求头部设置
});

// 请求拦截器
instance.interceptors.request.use(function (config) {
    const { method, data } = config;
    if (method.toLocaleLowerCase() === 'post') { 
        // 将对象转化 避免服务端不能接收JSON格式
        if (data instanceof Object) { 
            config.data = qs.stringify(data)
        }
    }
    return config;
}, function (error) {
    return Promise.reject(error);
});

// 响应报文拦截器
instance.interceptors.response.use(function (response) {
    const { data, status,msg } = response
    if (status ===  0) {
        return data;
    } else { 
        message.error(msg);
    }
}, function (error) {
   // 请求失败
        if (error.response.status === 401) {
            message.error('身份校验失败', 1);
            // 分发一个清除用户信息的action
            store.dispatch(createDeleteUserInfoAction());
        } else { 
            message.error(error.message);
        }
        return new Promise(() => { }) // 中断Promise量
});

export default instance;