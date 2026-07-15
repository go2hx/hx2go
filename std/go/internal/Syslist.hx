package go.internal;

@:go.Type({ name: "syslist", instanceName: "syslist.syslist", imports: ["internal/syslist"] })
extern class Syslist {

    @:native("KnownArch") static var KnownArch: go.Map<String, Bool>;
    @:native("KnownOS") static var KnownOS: go.Map<String, Bool>;
    @:native("UnixOS") static var UnixOS: go.Map<String, Bool>;

}