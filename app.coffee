express = require "express"
hamlc = require 'haml-coffee'

app = express.createServer()
app.register '.hamlc', hamlc
app.set('view engine', 'hamlc');

app.get '/', (req, res) ->
  res.render 'welcome', name: 'gdz'

app.get '/people', (req, res) ->
  res.send {a:'gente 1', b:['gente 2', 'gente 3']}

app.listen process.env.PORT || 3000