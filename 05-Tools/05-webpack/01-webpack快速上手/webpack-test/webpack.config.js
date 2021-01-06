// ./webpack.config.js
/** @type {import('webpack').Configuration} */

const path = require('path')

const config = {
  entry: './src/index.js',
  output: {
    filename: 'main.js',
    path: path.join(__dirname,'dist')
  }
}
module.exports = config

