/**
 * 最近最少使用缓存淘汰算法
 *
 * @class LRU（least recently use）
 */
class LRU {
  static maxSize = 100
  constructor() {
    this.linkList = new LinkList()
  }
  /**
   * through data get data from cache
   *
   * @param {*} data
   * @returns
   * @memberof LRU
   */
  getData(key) {
    let selectNode = this.linkList.select(key, function (node) {
      return key === node.data.key
    })
    if (selectNode) {
      if (0 !== selectNode.index) {
        this.linkList.delete(selectNode.index)
        this.linkList.insertFirst(selectNode.node.data)
      }
      return selectNode.node.data
    } else {
      return null
    }
  }
  /**
   * save data into cache
   *
   * @param {*} data
   * @memberof LRU
   */
  saveData(data) {
    if (!this.getData(data.key)) {
      this.linkList.insertFirst(data)
    }
  }
}
