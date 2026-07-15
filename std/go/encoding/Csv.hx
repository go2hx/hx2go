package go.encoding;

@:go.Type({ name: "csv", instanceName: "csv.csv", imports: ["encoding/csv"] })
extern class Csv {

    @:native("NewReader") static function newReader(r: go.io.Reader): go.Pointer<go.encoding.csv.Reader>;
    @:native("NewWriter") static function newWriter(w: go.io.Writer): go.Pointer<go.encoding.csv.Writer>;

}