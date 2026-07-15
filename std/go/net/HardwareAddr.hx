package go.net;

@:go.Type({ name: "HardwareAddr", instanceName: "net.HardwareAddr", imports: ["net"] })
extern class HardwareAddr {

    @:native("String") function string(): String;

}