package go.encoding.json.jsontext;

@:structInit
@:go.Type({ name: "encodeBuffer", instanceName: "jsontext.encodeBuffer", imports: ["encoding/json/jsontext"] })
extern class EncodeBuffer {

    @:native("Buf") var buf: go.Slice<go.Byte>;

    function new(buf: go.Slice<go.Byte>=null);

}