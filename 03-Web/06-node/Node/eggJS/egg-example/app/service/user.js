const { Service } = require('egg')
class UserService extends Service {
  async list() {
    return await this.app.mysql.select('user')
  }
  async insert(user) {
    let result = await this.app.mysql.insert('user', user)
     return result
  }
 async update(user){
     let result = await this.app.mysql.update('user',user)
     return result
 }
 async destroy(id){
     return await this.app.mysql.delete('user',{id:id})
 }
}

module.exports = UserService
