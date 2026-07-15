package go.net.internal.socktest;

@:structInit
@:go.Type({ name: "Status", instanceName: "socktest.Status", imports: ["net/internal/socktest"] })
extern class Status {

    @:native("Cookie") var cookie: go.net.internal.socktest.Cookie;
    @:native("Err") var err: go.Error;
    @:native("SocketErr") var socketErr: go.Error;

function new(cookie: go.net.internal.socktest.Cookie, err: go.Error, socketErr: go.Error);

    @:native("String") function string(): String;

}