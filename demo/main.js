angular.module("uriJsParser", [])
    .controller("MainController", function () {
        this.uriInput = "http://uri.com/demo?p1=1&p2=2";
        this.detailShow = false;

        this.parse = function () {
            this.detailShow = !this.detailShow;

            if (this.detailShow) {
                this.uri = new CXUri(this.uriInput);

                this.host = this.uri.scheme() + "://" + this.uri.authority();
                this.scheme = this.uri.scheme();
                this.path = this.uri.path();
                this.queries = $.map(this.uri.queries(), function (value, index) {
                    return [{k: index, v: value}];
                });
            } else {
                var q = [];
                this.queries.forEach(function (obj) {
                    q.push(obj.k + "=" + obj.v);
                });
                var queryParams = q.join("&");
                if (queryParams !== "") {
                    queryParams = "?" + queryParams;
                }
                this.uriInput = this.host + this.path + queryParams;
            }
        };

        this.deleteQueryParam = function ($index) {
            this.queries.splice($index, 1);
        };

        this.addQueryParam = function () {
            this.queries.push({k: "", v: ""});
        };

        this.encParam = function (q) {
            console.log(encodeURIComponent(q.v));
            q.v = encodeURIComponent(q.v);
        };

        this.decParam = function (q) {
            console.log(decodeURIComponent(q.v));
            q.v = decodeURIComponent(q.v);
        };
    });
