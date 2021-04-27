const resolve = dir => require('path').join(__dirname, dir)
module.exports = {
  configureWebpack: {
    resolve: {
      alias: {
        // 设置路径别名
        '@': resolve('src')
      }
    }
  }
}