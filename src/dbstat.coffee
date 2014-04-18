class DbStats
  init: () ->
    @clear()

  clear: () ->
    @totalQueries = 0
    @totalTimeMillisecond = 0
    @startTime = 0

  addQuery: (timing) ->
    @totalQueries += 1
    @totalTimeMillisecond += timing

  beforeExecuteQuery: () ->
    @startTime = new Date().getTime()

  afterExecuteQuery: () ->
    @addQuery (new Date().getTime()) - @startTime

  getStats: () ->
    'totalQueries':@totalQueries, 'totalTimeSeconds':@totalTimeMillisecond+'ms'

module.exports = DbStats
