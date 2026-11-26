package go.net;

/**
    A HardwareAddr represents a physical hardware address.
**/
@:go.Type({ name: "HardwareAddr", instanceName: "net.HardwareAddr", imports: ["net"] })
extern class HardwareAddr {

    @:native("String") function string(): (String);

}