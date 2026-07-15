package go.encoding.json;

@:structInit
@:go.Type({ name: "Decoder", instanceName: "json.Decoder", imports: ["encoding/json"] })
extern class Decoder {

    @:native("Buffered") function buffered(): go.io.Reader;
    @:native("Decode") function decode(v: Dynamic): go.Error;
    @:native("DisallowUnknownFields") function disallowUnknownFields(): Void;
    @:native("InputOffset") function inputOffset(): go.Int64;
    @:native("More") function more(): Bool;
    @:native("Token") function token(): go.Result<go.encoding.json.Token>;
    @:native("UseNumber") function useNumber(): Void;

}