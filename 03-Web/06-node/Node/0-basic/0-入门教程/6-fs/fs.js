'use strict'
var fs = require('fs')
var readfile = function () {
  fs.readFile('file.txt', 'utf-8', function (error, data) {
    if (error) {
      console.log(error)
    } else {
      console.log(data)
    }
  })
}
module.exports = readfile
