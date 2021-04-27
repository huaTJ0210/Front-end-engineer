const { Controller } = require('egg')
class UserController extends Controller {
  async index() {
    const { ctx, service } = this
    let users = await service.user.list()
    ctx.body = users
  }
  async create() {
    const { ctx, service } = this
    await service.user.insert(ctx.request.body)
    ctx.body={
      code:0,
      data:'success'
    }
  }
  async update(){
    const {ctx,service} = this
    let user = ctx.request.body
    await service.user.update(user)
    ctx.body={
      code:0,
      data:'success'
    }
  }
  async destroy(){
    const {ctx,service} = this;
    let id = ctx.params.id;
    await service.user.destroy(id)
    ctx.body={
      code:0,
      data:'success'
    }
  }
}
module.exports = UserController
