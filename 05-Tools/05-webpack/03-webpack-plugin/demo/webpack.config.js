// ./webpack.config.js
/** @type {import('webpack').Configuration} */

const path = require('path')

const { CleanWebpackPlugin } = require('clean-webpack-plugin')
const HtmlWebpackPlugin = require('html-webpack-plugin')

const config = {
  entry: './src/index.js',
  output: {
    filename: 'bundle.js',
    path: path.join(__dirname, 'dist')
  },
  plugins: [new CleanWebpackPlugin(), new HtmlWebpackPlugin({
    title: 'webpack plugin Sample',
    meta: {
      viewport:'width=device-width'
    },
    template:'./index.htm'
  })]
}
module.exports = config

