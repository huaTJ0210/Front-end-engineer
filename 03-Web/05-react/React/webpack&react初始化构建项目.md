### 手动创建 

 + 初始化项目
 + 配置webpack
 + 设置jsx解析器babel
 + 完成打包工作 
 
#### 创建工程目录 

  设置项目名称：myapp 
  
#### 设置工程基本信息
    npm init 
    
####  webpack配置文件 

    webpack.config.js：
  
     const path = require('path');
		module.exports = {
		    entry:'./src/index.js',//入口文件的相对路径
		    output:{
		        path:path.resolve(__dirname,'build'),//打包文件的输出路径
		        filename:'bundle.js' // 打包文件名
		    }
		}
		
#### webpack 打包到build目录下 

   `安装webpack: npm install webpack --save-dev`
   `npm install webpack -g`
   
####  在 package.json中设置初始化脚本

     "scripts": {
    "start": "webpack --progress --watch --hot"
    },
   
   在打包时可以使用npm start 命令打包
   
#### webpack需要知道我们html入口文件，节省手动引入打包后的js文件
   
   需要安装`html-webpack-plugin`
   执行命令`npm install html-webpack-plugin --save-dev`
   
   然后执行 `npm link webpack --save-dev` 否则报`'webpack/lib/node/NodeTemplatePlugin`
   
####  修改webpack.config.js
  
  
      const HtmlWebpackPlugin = require('html-webpack-plugin');
		module.exports = {
		    plugins: [
		        new HtmlWebpackPlugin({
		            template: './public/index.html', //指定模板路径
		            filename: 'index.html', //指定文件名
		        })
		    ]
		}
		
#### 开启React项目 
  
   `npm install react react-dom --save-dev`
  
#### 安装JSX的解析器 babel
 
    + npm install -D babel-loader
    + npm install -D babel-core
    + npm install -D babel-preset-env
   
#### 配置babel的规则 添加webpack.config.js
  
	     module:{
	        rules:[// 配置加载器
	            {
	               test:/\js$/,//配置要处理文件的格式，一般使用正则表达式匹配
	               loader:'babel-loader',//使用的加载器名称
	               query:{ // babel的配置参数
	                  presets:['env','react']
	               }
	            }
	         ]
	    }

### 使用create-react-app 快速构建 React 开发环境  

create-react-app 是来自于 Facebook，通过该命令我们无需配置就能快速构建 React 开发环境。
create-react-app 自动创建的项目是基于 Webpack + ES6 

+ npm install -g create-react-app
+ create-react-app my-app
+ cd my-app/
+ npm start   






