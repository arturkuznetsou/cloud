console.log('Hello world');

const http = require('http');




const request = require('request');
const listener = function (req, res) {

	request('http://www.google.com', function (error, response, body) {
		console.error('error:', error);
		console.log('statusCode:', response && response.statusCode);
		body = body.replace(/I.+Lucky/g, 'Hello world')
		res.end(body);
	});


	res.writeHead(200);
}
const server = http.createServer(listener);
module.exports = listener;

server.listen(8080);

