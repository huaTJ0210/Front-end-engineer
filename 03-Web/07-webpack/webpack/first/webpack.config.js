const HtmlWebpackPlugin = require('html-webpack-plugin'); // 通过 npm 安装
const webpack = require('webpack'); // 访问内置的插件
const path = require('path');

module.exports = {
  entry: __dirname+'/src/main.js',
  output: {
    path:__dirname+'/public',
    filename:'bundle.js'
  },
  module: {
    rules: [
        {
          test: /\.css$/i,
          use: ['style-loader', 'css-loader'],
        },
        {
          test: /\.html$/i,
          loader: 'html-loader',
        }
    ]
  },
  plugins: [
    new HtmlWebpackPlugin({template:'./src/index.htm'})
  ]
}