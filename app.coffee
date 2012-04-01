express = require "express"

app = express.createServer()

app.get '/', (req, res) ->
  res.send 'Hi coffee addict\n'

app.get '/people', (req, res) ->
  res.send {a:'gente 1', b:['gente 2', 'gente 3']}

app.listen process.env.PORT || 3000