package go.compress.gzip;

@:structInit
@:go.Type({ name: "Header", instanceName: "gzip.Header", imports: ["compress/gzip"] })
extern class Header {

    @:native("Comment") var comment: String;
    @:native("Extra") var extra: go.Slice<go.Byte>;
    @:native("ModTime") var modTime: go.time.Time;
    @:native("Name") var name: String;
    @:native("OS") var OS: go.Byte;

function new(comment: String, extra: go.Slice<go.Byte>, modTime: go.time.Time, name: String, OS: go.Byte);

}