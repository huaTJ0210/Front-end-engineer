import { SAVE_USER_INFO, DELETE_USER_INFO } from '../actionsType'
const userStr = localStorage.getItem('user');
let user;
if (userStr != null) {
    user = JSON.parse(userStr);
}
const token = localStorage.getItem('token');
const isLogin = user && token ? true : false;

let initState = {
    user: user || '',
    token: token || '',
    isLogin: isLogin
}
export default function loginReducer(preState = initState, action) {
    const { type, data } = action
    let newState;
    switch (type) {
        case SAVE_USER_INFO:
            newState = { user: data.user, token: data.token, isLogin: true }
            return newState;
        case DELETE_USER_INFO:
            newState = { user: '', token: '', isLogin: false }
            return newState;
        default:
            return preState;
    }
}