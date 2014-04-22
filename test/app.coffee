request = require('supertest')

app = require('../target/app')

describe('GET /', () ->
  it('respond / should return plain text', (done) ->
    request(app)
    .get('/')
    .expect(200, done)))
