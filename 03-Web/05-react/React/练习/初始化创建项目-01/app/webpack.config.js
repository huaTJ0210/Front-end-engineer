const path = require('path')
const HtmlWebPackPlugin = require('html-webpack-plugin')

const htmlPlugin = new HtmlWebPackPlugin({
    template: path.join(__dirname, './src/index.htm'),// 源文件
    filename: 'index.html' // 生成内存中首页的名称
})

module.exports = {
    mode: 'development',// development、producttion
    plugins: [
        htmlPlugin
    ],
    module: { // 所有三方 模块的配置规则
        rules: [
            {
                test: /\.js|jsx$/, use: 'babel-loader', exclude: /node_modules/
            }
        ]
    },
    resolve: {
        extensions: ['.js', '.jsx', '.json'], //文件后缀可以省略
        alias: {
            '@':path.join(__dirname,'./src') // @ 表示src这层目录
        }
    }
}