const http = require('http');
const { hostname } = require('os');
const port = 3000;

const server = http.createServer((request, response) => {
  console.log(request);
  response.statusCode = 200;
  response.setHeader('Content-Type', 'text/plain');
  response.end('你好世界\n');
});

server.listen(port, () => {
  console.log(`服务器运行在 http://${hostname}:${port}/`);
});
