class LinkList {
  constructor() {
    this.header = new Node('', null)
    this.size = 0
  }
  /**
   * size of linklist
   *
   * @returns
   * @memberof LinkList
   */
  getSize() {
    return this.size
  }
  /**
   * insert data at index of LinkList
   *
   * @param {*} data
   * @param {*} index
   * @memberof LinkList
   */
  insert(data, index) {
    if (index < 0 || index > this.size) {
      throw new Error('Op:error index for insert operation!')
    }
    if (0 === this.size) {
      this.header.next = new Node(data, null)
    } else {
      var tempNode = this.header
      var newNode = new Node(data, null)
      for (var i = 0; i < index; i++) {
        tempNode = tempNode.next
      }
      newNode.next = tempNode.next
      tempNode.next = newNode
    }
    this.size++
  }
  /**
   * header insert
   *
   * @param {*} data
   * @memberof LinkList
   */
  insertFirst(data) {
    this.insert(data, 0)
  }
  /**
   * trail insert
   *
   * @param {*} data
   * @memberof LinkList
   */
  insertLast(data) {
    this.insert(data, this.size)
  }
  /**
   *
   *
   * @param {*} data
   * @returns if select data not in linklist function return null else return a node
   * @memberof LinkList
   */
  select(data, isEqualFunction) {
    if (0 === this.size) {
      return { node: null, index: -1 }
    } else {
      var tempNode = this.header
      for (var i = 0; i < this.size; i++) {
        tempNode = tempNode.next
        // TODO:待解决？？？？根据Data进行比较是否为要找的Node适用性太差「缓存一般会传递key」
        if (isEqualFunction) {
          if (isEqualFunction()) {
            return { node: tempNode, index: i }
          }
        } else {
          if (tempNode.data === data) {
            return { node: tempNode, index: i }
          }
        }
      }
      return { node: null, index: -1 }
    }
  }

  /**
   *
   * delete index of linklist
   * @param {*} index
   * @memberof LinkList
   */
  delete(index) {
    if (0 === this.size) {
      throw new Error('Linklist is empty！！')
    }
    if (index < 0 || index >= this.size) {
      throw new Error('Op:error index for delete operation!')
    }
    var tempNode = this.header
    for (var i = 0; i < index; i++) {
      tempNode = tempNode.next
    }
    tempNode.next = tempNode.next.next
    this.size--
  }
  /**
   * header delete
   *
   * @memberof LinkList
   */
  deleteFirst() {
    this.delete(0)
  }

  /**
   * trail delete
   *
   * @memberof LinkList
   */
  deleteLast() {
    this.delete(this.size - 1)
  }
  /**
   * description of linklist
   *
   * @returns
   * @memberof LinkList
   */
  description() {
    var linklistString = 'header->'
    var tempNode = this.header
    for (var i = 0; i < this.size + 1; i++) {
      tempNode = tempNode.next
      if (tempNode) {
        linklistString = linklistString + tempNode.data + '->'
      } else {
        linklistString = linklistString + 'NULL'
      }
    }
    return linklistString
  }
}

/**
 * Node of LinkList
 *
 * @class Node
 */
class Node {
  constructor(data, next) {
    this.data = data
    this.next = next
  }
}
