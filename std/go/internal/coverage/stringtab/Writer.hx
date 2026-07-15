package go.internal.coverage.stringtab;

@:structInit
@:go.Type({ name: "Writer", instanceName: "stringtab.Writer", imports: ["internal/coverage/stringtab"] })
extern class Writer {

    @:native("Freeze") function freeze(): Void;
    @:native("InitWriter") function initWriter(): Void;
    @:native("Lookup") function lookup(s: String): go.UInt32;
    @:native("Nentries") function nentries(): go.UInt32;
    @:native("Size") function size(): go.UInt32;
    @:native("Write") function write(w: go.io.Writer): go.Error;

}