'use strict'
var fs = require('fs')
var rs = fs.createReadStream('file.txt', 'utf-8')
rs.on('data', function (chunk) {
  console.log('data')
  console.log(chunk)
})
rs.on('on', function () {
  console.log('end')
})
rs.on('error', function () {
  console.log('error:' + error)
})
