package go.net;

/**
    Addr represents a network end point address.
    
    The two methods [Addr.Network] and [Addr.String] conventionally return strings
    that can be passed as the arguments to [Dial], but the exact form
    and meaning of the strings is up to the implementation.
**/
@:go.Type({ name: "Addr", instanceName: "net.Addr", imports: ["net"] })
extern typedef Addr = {

    @:native("Network") function network(): (String);
    @:native("String") function string(): (String);

}