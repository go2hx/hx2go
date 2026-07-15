package go.encoding.csv;

@:structInit
@:go.Type({ name: "Writer", instanceName: "csv.Writer", imports: ["encoding/csv"] })
extern class Writer {

    @:native("Comma") var comma: go.Rune;
    @:native("UseCRLF") var useCRLF: Bool;

function new(comma: go.Rune, useCRLF: Bool);

    @:native("Error") function error(): go.Error;
    @:native("Flush") function flush(): Void;
    @:native("Write") function write(record: go.Slice<String>): go.Error;
    @:native("WriteAll") function writeAll(records: go.Slice<go.Slice<String>>): go.Error;

}