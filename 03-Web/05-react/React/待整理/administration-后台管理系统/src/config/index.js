// 项目统一请求地址

/*
  dev ： 测试开发环境
  prod:  生产环境
*/
let env = 'dev';

const projectConfig = {};
if (env === 'dev') {
    projectConfig.BASEURL = '';
} else { 
    projectConfig.BASEURL = '';
}

export default projectConfig;