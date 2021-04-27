// 导入koa
const Koa = require('koa')
// 创建一个Koa对象表示web app本身
const app = new Koa()
// 创建sequelize对象实例
const Sequelize = require('sequelize')
const config = require('./config')

var sequelize = new Sequelize(config.database, config.username, config.password, {
  host: config.host,
  dialect: 'mysql',
  pool: {
    max: 5,
    min: 0,
    idle: 30000
  }
})

// 模型与数据库表做对应
var Pet = sequelize.define(
  'pet',
  {
    id: {
      type: Sequelize.STRING(50),
      primaryKey: true
    },
    name: Sequelize.STRING(100),
    gender: Sequelize.BOOLEAN,
    birth: Sequelize.STRING(10),
    createdAt: Sequelize.BIGINT,
    updatedAt: Sequelize.BIGINT,
    version: Sequelize.BIGINT
  },
  {
    timestamps: false
  }
)

// 新增数据
var now = Date.now();
/*
Pet.create({
  id: 'g-' + now,
  name: 'Gaffey',
  gender: false,
  birth: '2007-07-07',
  createdAt: now,
  updatedAt: now,
  version: 0
})
  .then(function (p) {
    console.log('created.' + JSON.stringify(p))
  })
  .catch(function (err) {
    console.log('failed: ' + err)
  })*/
(async () => {
    var dog = await Pet.create({
        id: 'd-' + now,
        name: 'Odie',
        gender: false,
        birth: '2008-08-08',
        createdAt: now,
        updatedAt: now,
        version: 0
    })
    console.log('created: ' + JSON.stringify(dog))
})();

;(async () => {
  var pets = await Pet.findAll({
    where: {
      name: 'Gaffey'
    }
  })
  console.log(`find ${pets.length} pets:`)
  for (let p of pets) {
    console.log(JSON.stringify(p))
  }
})()



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
