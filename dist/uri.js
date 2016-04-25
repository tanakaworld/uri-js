var CXUri;

CXUri = (function() {
  function CXUri(uriStr) {
    var k, re, ref, v;
    re = /^(([^:\/?#]+):)?(\/\/([^\/?#]*))?([^?#]*)(\?([^#]*))?(#(.*))?/;
    this.uri = {};
    ref = uriStr.match(re);
    for (k in ref) {
      v = ref[k];
      this.uri[k] = v;
    }
  }

  CXUri.prototype.scheme = function() {
    return this.uri[2] || null;
  };

  CXUri.prototype.authority = function() {
    return this.uri[4] || null;
  };

  CXUri.prototype.path = function() {
    return this.uri[5] || null;
  };

  CXUri.prototype.query = function() {
    return this.uri[7] || null;
  };

  CXUri.prototype.queries = function() {
    var i, pair, params, str, strs;
    if (!this.query()) {
      return [];
    }
    strs = this.query().split('&');
    params = {};
    for (i in strs) {
      str = strs[i];
      pair = str.split("=");
      if (pair.length !== 2) {
        break;
      }
      params[pair[0]] = pair[1];
    }
    return params;
  };

  return CXUri;

})();
