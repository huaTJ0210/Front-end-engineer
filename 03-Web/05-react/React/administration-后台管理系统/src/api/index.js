import httpAxios from './httpAxios'

import jsonp from 'jsonp'

// 登录请求
export const reqLogin = (username, password) => { httpAxios.post('/login', { username, password }) }

// 请求天气信息的接口【将回调函数的返回值，返回给外层函数，可使用promise】
export const reqWeather = () => { 
    return new Promise((resolve, reject) => {
        jsonp('', (error, data) => {
            if (error) {
              // 中断promise
                return new Promise(() => {});
            } else { 
                resolve(data);
            }
        })
    });
}