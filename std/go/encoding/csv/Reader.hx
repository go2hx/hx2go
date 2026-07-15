package go.encoding.csv;

@:structInit
@:go.Type({ name: "Reader", instanceName: "csv.Reader", imports: ["encoding/csv"] })
extern class Reader {

    @:native("Comma") var comma: go.Rune;
    @:native("Comment") var comment: go.Rune;
    @:native("FieldsPerRecord") var fieldsPerRecord: go.GoInt;
    @:native("LazyQuotes") var lazyQuotes: Bool;
    @:native("TrimLeadingSpace") var trimLeadingSpace: Bool;
    @:native("ReuseRecord") var reuseRecord: Bool;
    @:native("TrailingComma") var trailingComma: Bool;

function new(comma: go.Rune, comment: go.Rune, fieldsPerRecord: go.GoInt, lazyQuotes: Bool, trimLeadingSpace: Bool, reuseRecord: Bool, trailingComma: Bool);

    @:go.Tuple("line", "column") @:native("FieldPos") function fieldPos(field: go.GoInt): go.Tuple<{ line: go.GoInt, column: go.GoInt }>;
    @:native("InputOffset") function inputOffset(): go.Int64;
    @:native("Read") function read(): go.Result<go.Slice<String>>;
    @:native("ReadAll") function readAll(): go.Result<go.Slice<go.Slice<String>>>;

}