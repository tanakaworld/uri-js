class CXUri
  constructor: (uriStr) ->
    # URI Generic Syntax
    # RFC3986 https://tools.ietf.org/html/rfc3986#page-51
    re = /^(([^:/?#]+):)?(\/\/([^/?#]*))?([^?#]*)(\?([^#]*))?(#(.*))?/

    @uri = {}
    @uri[k] = v for k, v of uriStr.match(re)

  scheme: -> @uri[2] || null
  authority: -> @uri[4] || null
  path: -> @uri[5] || null
  query: -> @uri[7] || null
  queries: ->
    return [] unless @query()

    strs = @query().split('&')
    params = {}
    for i,str of strs
      pair = str.split("=")
      break if pair.length != 2
      params[pair[0]] = pair[1]

    return params
