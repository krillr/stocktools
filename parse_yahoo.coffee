http = require 'http'
q = require 'q'
util = require 'util'

HISTORY_URL = "http://ichart.finance.yahoo.com/table.csv?s=%s&a=%s&b=%s&c=%s&d=%s&e=%s&f=%s&g=d&ignore=.csv"

@parseSymbols = (symbols) ->
  deferred = q.defer()
  today = new Date()
  promises = []
  for symbol in symbols
    url = util.format HISTORY_URL, symbol, today.getMonth(), today.getDate(), today.getFullYear()-1, today.getMonth(), today.getDate(), today.getFullYear()
    symbol_deferred = 
  return deferred.promise

@parseSymbols ['AAPL', 'MSFT']
