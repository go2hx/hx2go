package go.net.internal.socktest;

@:structInit
@:go.Type({ name: "Switch", instanceName: "socktest.Switch", imports: ["net/internal/socktest"] })
extern class Switch {

    @:go.Tuple("ns", "sa", "err") @:native("Accept") function accept(s: go.GoInt): go.Tuple<{ ns: go.GoInt, sa: go.syscall.Sockaddr, err: go.Error }>;
    @:go.Tuple("ns", "sa", "err") @:native("Accept4") function accept4(s: go.GoInt, flags: go.GoInt): go.Tuple<{ ns: go.GoInt, sa: go.syscall.Sockaddr, err: go.Error }>;
    @:native("Close") function close(s: go.GoInt): go.Error;
    @:native("Connect") function connect(s: go.GoInt, sa: go.syscall.Sockaddr): go.Error;
    @:native("GetsockoptInt") function getsockoptInt(s: go.GoInt, level: go.GoInt, opt: go.GoInt): go.Result<go.GoInt>;
    @:native("Listen") function listen(s: go.GoInt, backlog: go.GoInt): go.Error;
    @:native("Set") function set(t: go.net.internal.socktest.FilterType, f: go.net.internal.socktest.Filter): Void;
    @:native("Socket") function socket(family: go.GoInt, sotype: go.GoInt, proto: go.GoInt): go.Result<go.GoInt>;
    @:native("Sockets") function sockets(): go.net.internal.socktest.Sockets;
    @:native("Stats") function stats(): go.Slice<go.net.internal.socktest.Stat>;

}