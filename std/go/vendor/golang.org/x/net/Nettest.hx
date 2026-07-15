package go.vendor.golang.org.x.net;

@:go.Type({ name: "nettest", instanceName: "nettest.nettest", imports: ["vendor/golang.org/x/net/nettest"] })
extern class Nettest {

    @:native("LocalPath") static function localPath(): go.Result<String>;
    @:native("LoopbackInterface") static function loopbackInterface(): go.Result<go.Pointer<go.net.Interface>>;
    @:native("MulticastSource") static function multicastSource(network: String, ifi: go.Pointer<go.net.Interface>): go.Result<go.net.IP>;
    @:native("NewLocalListener") static function newLocalListener(network: String): go.Result<go.net.Listener>;
    @:native("NewLocalPacketListener") static function newLocalPacketListener(network: String): go.Result<go.net.PacketConn>;
    @:native("RoutedInterface") static function routedInterface(network: String, flags: go.net.Flags): go.Result<go.Pointer<go.net.Interface>>;
    @:native("SupportsIPv4") static function supportsIPv4(): Bool;
    @:native("SupportsIPv6") static function supportsIPv6(): Bool;
    @:native("SupportsRawSocket") static function supportsRawSocket(): Bool;
    @:native("TestConn") static function testConn(t: go.Pointer<go.testing.T>, mp: go.vendor.golang.org.x.net.nettest.MakePipe): Void;
    @:native("TestableAddress") static function testableAddress(network: String, address: String): Bool;
    @:native("TestableNetwork") static function testableNetwork(network: String): Bool;

}