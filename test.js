const website = require('./main');
const should = require('chai').should();
const request = require('supertest');

//Gebaseerd op https://github.com/GoogleCloudBuild/code-examples/blob/master/multiple-node-versions-example/test.js

describe('test.js', () => {
        describe('GET /', () => {
                it('RESPONSE 200', (done) => {
                        request(website).get('/').expect(200).end((e, res) => {
                                should.not.exist(e);
                                done();
                            });
                    });
            });
    });
