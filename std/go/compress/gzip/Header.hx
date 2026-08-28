package go.compress.gzip;

/**
    The gzip file stores a header giving metadata about the compressed file.
    That header is exposed as the fields of the [Writer] and [Reader] structs.
    
    Strings must be UTF-8 encoded and may only contain Unicode code points
    U+0001 through U+00FF, due to limitations of the GZIP file format.
**/
@:structInit
@:go.Type({ name: "Header", instanceName: "gzip.Header", imports: ["compress/gzip"] })
extern class Header {

    @:native("Comment") var comment: String;
    @:native("Extra") var extra: go.Slice<go.Byte>;
    @:native("ModTime") var modTime: go.time.Time;
    @:native("Name") var name: String;
    @:native("OS") var OS: go.Byte;

    function new(comment: String="", extra: go.Slice<go.Byte>=null, modTime: go.time.Time, name: String="", OS: go.Byte=0);

}