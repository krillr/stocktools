http = require 'http'
fs = require 'fs'
excelParser = require 'excel-parser'
temp = require 'temp'
temp.track()

WEEKLY_XLS_URL = 'http://www.cboe.com/publish/weelkysmf/weeklysmf.xls'
SYMBOL_PATTERN = /^[A-Z]+$/

@getSymbols = ->
  tempXlsPath = temp.path { suffix: '.xls' }

  http.get WEEKLY_XLS_URL, (response) ->
    file = fs.createWriteStream tempXlsPath
    response.pipe file
    response.on 'end', ->
      excelParser.parse {
        inFile: tempXlsPath,
        worksheet: 1
      }, (err, records) ->
        for record in records
          if SYMBOL_PATTERN.test record[0]
            console.log record[0]
