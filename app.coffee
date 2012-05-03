express = require "express"
hamlc = require 'haml-coffee'
io = require 'socket.io'

app = express.createServer()

io = io.listen(app)


app.register '.hamlc', hamlc
app.set('view engine', 'hamlc');

app.get '/', (req, res) ->
  res.render 'welcome', name: 'gdz'

app.get '/people', (req, res) ->
  res.send {a:'gente 1', b:['gente 2', 'gente 3']}

app.listen process.env.PORT || 3000

io.sockets.on 'connection',  (socket) ->
  socket.emit 'news', { hello: 'world' }
  socket.on 'my other event', (data)->
    console.log(data)
    socket.emit 'news', { winner: "player #{data.tournament + 2}" }
