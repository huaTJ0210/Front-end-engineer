// 导入koa
const Koa = require('koa')
// 导入koa-bodyParser 
const bodyParser = require('koa-bodyparser')
// 引入controller
const controller = require('./controller')
// 创建一个Koa对象表示web app本身
const app = new Koa()
// 使用 bodyParser
app.use(bodyParser())
app.use(controller())
// 端口监听
app.listen(3000)
console.log('app started at port 3000...')