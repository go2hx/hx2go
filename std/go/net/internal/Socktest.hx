package go.net.internal;

@:go.Type({ name: "socktest", instanceName: "socktest.socktest", imports: ["net/internal/socktest"] })
extern class Socktest {

    @:native("FilterAccept") static var FilterAccept: go.net.internal.socktest.FilterType;
    @:native("FilterClose") static var FilterClose: go.net.internal.socktest.FilterType;
    @:native("FilterConnect") static var FilterConnect: go.net.internal.socktest.FilterType;
    @:native("FilterGetsockoptInt") static var FilterGetsockoptInt: go.net.internal.socktest.FilterType;
    @:native("FilterListen") static var FilterListen: go.net.internal.socktest.FilterType;
    @:native("FilterSocket") static var FilterSocket: go.net.internal.socktest.FilterType;

}