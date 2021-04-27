// 导入koa
const Koa = require('koa')
// 导入koa-bodyParser
const bodyParser = require('koa-bodyparser')

// require('koa-router')返回的是一个函数
const router = require('koa-router')()

// 创建一个Koa对象表示web app本身
const app = new Koa()
// 使用 bodyParser
app.use(bodyParser())

// 在async函数中为什么会调用 await next()
// 每一个async函数称之为middleware

// (1)
app.use(async (ctx, next) => {
  console.log(`${ctx.request.method}-${ctx.request.url}`)
  await next() //调用下一个middleware
})

// (2) add url router : 根据get请求匹配对应的url返回数据响应值
router.get('/hello/:name', async (ctx, next) => {
  var name = ctx.params.name
  ctx.response.body = `<h1>Hello,${name}</h1>`
})

// 一个表单登录
router.get('/', async (ctx, next) => {
  ctx.response.body = `<h1>Index</h1>
        <form action="/signin" method="post">
            <p>Name: <input name="name" value="koa"></p>
            <p>Password: <input name="password" type="password"></p>
            <p><input type="submit" value="Submit"></p>
        </form>`
})

// post 请求接收
router.post('/signin', async (ctx, next) => {
  var name = ctx.request.body.name || '',
    password = ctx.request.body.password || ''
  console.log(`signin with name: ${name}, password: ${password}`)
  if (name === 'koa' && password === '12345') {
    ctx.response.body = `<h1>Welcome, ${name}!</h1>`
  } else {
    ctx.response.body = `<h1>Login failed!</h1>
        <p><a href="/">Try again</a></p>`
  }
})

// (3) add router middleware
app.use(router.routes())

// (4)
app.use(async (ctx, next) => {
  const start = new Date().getTime()
  await next()
  const ms = new Date().getTime() - start
  console.log(`Time:${ms}`)
})

//(3) 对于任何请求，app将调用该异步函数处理请求
// app.use(
//     // ctx是koa封装的一个对象，可以获取http的request和response
//     // next是koa传入的将要处理的下一个异步函数
//     async (ctx, next) => {
//         await next()
//         ctx.response.type = 'text/html'
//         ctx.response.body = '<h1>Hello Koa2</h1>'
//     }
// )
// 端口监听
app.listen(3000)
console.log('app started at port 3000...')
