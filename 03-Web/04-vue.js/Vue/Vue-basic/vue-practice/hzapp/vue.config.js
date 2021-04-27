'use strict';
const path = require('path');

function resolve(dir) {
  return path.join(__dirname, dir);
}
// cli_api配置地址 https://cli.vuejs.org/zh/config/
module.exports = {
  publicPath: '/',
  outputDir: 'dist',
  assetsDir: 'static',
  lintOnSave: process.env.NODE_ENV === 'development',
  productionSourceMap: false,
  devServer: {
    proxy: {
      // 例如将'http://localhost:8080/api/xxx'代理到'https://xxx.com/api/xxx'
      '/api': {
        target: process.env.VUE_APP_DOMAIN_URL,
        secure: false, //  如果是https接口，需要配置这个参数
        changeOrigin: false, // 如果接口跨域，需要进行这个参数配置
        //pathRewrite: {'^/api': ''}   pathRewrite 来重写地址，将前缀 '/api' 转为 '/'。
      },
    },
  },
  pluginOptions: {}, // 第三方插件配置
  configureWebpack: {
    name: 'name',
    resolve: {
      alias: {
        '@': resolve('src'),
      },
    },
  },
  chainWebpack(config) {},
};
