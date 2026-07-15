package go.net;

@:go.Type({ name: "IPMask", instanceName: "net.IPMask", imports: ["net"] })
extern class IPMask {

    @:go.Tuple("ones", "bits") @:native("Size") function size(): go.Tuple<{ ones: go.GoInt, bits: go.GoInt }>;
    @:native("String") function string(): String;

}