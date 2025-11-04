import http from 'node:http';
const port = process.env.PORT || 8080;
const server = http.createServer((req, res) => {
  res.writeHead(200, {'content-type':'text/plain'});
  res.end('Hello from Cloud Run dev!\n');
});
server.listen(port, () => console.log(`Listening on ${port}`));
