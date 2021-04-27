// 导入koa
const Koa = require('koa')
// 创建一个Koa对象表示web app本身
const app = new Koa()

// 在async函数中为什么会调用 await next()
// 每一个async函数称之为middleware

// (1)
app.use(async (ctx, next) => {
  console.log(`${ctx.request.method}-${ctx.request.url}`)
  await next() //调用下一个middleware
})

// (2)
app.use(async (ctx, next) => {
  const start = new Date().getTime()
  await next()
  const ms = new Date().getTime() - start
  console.log(`Time:${ms}`)
})

//(3) 对于任何请求，app将调用该异步函数处理请求
app.use(
  // ctx是koa封装的一个对象，可以获取http的request和response
  // next是koa传入的将要处理的下一个异步函数
  async (ctx, next) => {
    await next()
    ctx.response.type = 'text/html'
    ctx.response.body = '<h1>Hello Koa2</h1>'
  }
)
// 端口监听
app.listen(3000)
console.log('app started at port 3000...')
