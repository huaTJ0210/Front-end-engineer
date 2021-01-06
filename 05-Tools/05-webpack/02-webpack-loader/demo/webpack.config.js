/** @type {import('webpack').Configuration} */

const config = {
  entry: './src/main.css',
  output: {
    filename: 'bundle.js'
  },
  module: {
    rules: [
      {
        test: /\.css$/, //根据打包过程中遇到的文件路径匹配是否使用这个loader
        use: ['style-loader','css-loader']
      }
    ]
  }
}
module.exports = config