package go.encoding;

@:go.Type({ name: "json", instanceName: "json.json", imports: ["encoding/json"] })
extern class Json {

    @:native("Compact") static function compact(dst: go.Pointer<go.bytes.Buffer>, src: go.Slice<go.Byte>): (go.Error);
    @:native("HTMLEscape") static function hTMLEscape(dst: go.Pointer<go.bytes.Buffer>, src: go.Slice<go.Byte>): Void;
    @:native("Indent") static function indent(dst: go.Pointer<go.bytes.Buffer>, src: go.Slice<go.Byte>, prefix: String, indent: String): (go.Error);
    @:native("Marshal") static function marshal(v: Dynamic): (go.Result<go.Slice<go.Byte>>);
    @:native("MarshalIndent") static function marshalIndent(v: Dynamic, prefix: String, indent: String): (go.Result<go.Slice<go.Byte>>);
    @:native("NewDecoder") static function newDecoder(r: go.io.Reader): (go.Pointer<go.encoding.json.Decoder>);
    @:native("NewEncoder") static function newEncoder(w: go.io.Writer): (go.Pointer<go.encoding.json.Encoder>);
    @:native("Unmarshal") static function unmarshal(data: go.Slice<go.Byte>, v: Dynamic): (go.Error);
    @:native("Valid") static function valid(data: go.Slice<go.Byte>): (Bool);

}