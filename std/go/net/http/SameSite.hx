package go.net.http;

/**
    SameSite allows a server to define a cookie attribute making it impossible for
    the browser to send this cookie along with cross-site requests. The main
    goal is to mitigate the risk of cross-origin information leakage, and provide
    some protection against cross-site request forgery attacks.
    
    See https://tools.ietf.org/html/draft-ietf-httpbis-cookie-same-site-00 for details.
**/
@:go.Type({ name: "SameSite", instanceName: "http.SameSite", imports: ["net/http"] })
extern typedef SameSite = go.GoInt