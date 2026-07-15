package go.internal.coverage.stringtab;

@:structInit
@:go.Type({ name: "Reader", instanceName: "stringtab.Reader", imports: ["internal/coverage/stringtab"] })
extern class Reader {

    @:native("Entries") function entries(): go.GoInt;
    @:native("Get") function get(idx: go.UInt32): String;
    @:native("Read") function read(): Void;

}