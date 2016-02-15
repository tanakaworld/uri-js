describe CXUri, ->
  describe 'does not have query params', ->
    beforeEach ->
      @uri = new CXUri('http://dummy.com/user/detail')

    it 'get scheme', -> expect(@uri.scheme()).toEqual('http')
    it 'get path', -> expect(@uri.path()).toEqual('/user/detail')
    it 'get authorityが取得できる', -> expect(@uri.authority()).toEqual('dummy.com')
    it 'query is null', -> expect(@uri.query()).toBeNull()
    it 'queries is empty array', -> expect(@uri.queries()).toEqual(jasmine.objectContaining([]))

  describe 'has query params', ->
    beforeEach ->
      @uri = new CXUri('http://dummy.com/user/detail?p1=12345&p2=abcdef')

    it 'get scheme', -> expect(@uri.scheme()).toEqual('http')
    it 'get path', -> expect(@uri.path()).toEqual('/user/detail')
    it 'get authority', -> expect(@uri.authority()).toEqual('dummy.com')
    it 'get query', -> expect(@uri.query()).toEqual('p1=12345&p2=abcdef')
    it 'get queries', ->
      expect(@uri.queries()).toEqual(jasmine.objectContaining({p1: '12345', p2: 'abcdef'}))
