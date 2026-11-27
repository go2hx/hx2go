package haxe.http;

import go.Slice;
import go.context.CancelFunc;
import go.Context;
import go.context.Context as ContextType;
import go.Io;
import go.net.http.Client;
import go.io.Reader;
import go.net.http.Request;

class HttpGo extends haxe.http.HttpBase {
	public var responseHeaders:Map<String, String>;
    public var req:Request;
    var ctx:ContextType;
    var cancelFunc:CancelFunc;

	public function new(url:String) {
        super(url);
        var tmp = Context.withCancel(Context.background());
        ctx = tmp.ctx;
        cancelFunc = tmp.cancel;
	}

	public function cancel() {
        cancelFunc();
	}

	public override function request(post = false) {
		responseAsString = null;
		responseBytes = null;
		responseHeaders = null;
		if (postData != null || postBytes != null)
			post = true;
        var body:Reader = null;

        req = go.net.Http.newRequestWithContext(ctx, post ? "POST" : "GET", url, body).sure();
        for (header in headers) {
            req.header.set(header.name, header.value);
        }
        var q = req.URL.query();
		for (p in params) {
            q.add(p.name, p.value);
		}
        req.URL.rawQuery = q.encode();
        var body:Reader = null;

        var client = new Client();
        switch client._do(req) {
            case Ok(r):
                var s = r.statusCode;
                onStatus(s);
                var body = Io.readAll(r.body).sure();
                responseBytes = body;
                responseHeaders = [];
                var m:go.Map<String,Slice<String>> = cast r.header;
                for (name => value in m.keyValueIterator()) {
                    responseHeaders.set(name, value[value.length - 1]);
                }
                if (s >= 200 && s < 400) {
					success(responseBytes);
				} else {
					onError("Http Error #" + s);
				}
            case Err(e):
                onError(e.error());
        }
	}

    public static function requestUrl(url:String):String {
		var h = new Http(url);
		var r = null;
		h.onData = function(d) {
			r = d;
		}
		h.onError = function(e) {
			throw e;
		}
		h.request(false);
		return r;
	}
}
