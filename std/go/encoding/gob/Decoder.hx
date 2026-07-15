package go.encoding.gob;

@:structInit
@:go.Type({ name: "Decoder", instanceName: "gob.Decoder", imports: ["encoding/gob"] })
extern class Decoder {

    @:native("Decode") function decode(e: Dynamic): go.Error;
    @:native("DecodeValue") function decodeValue(v: go.reflect.Value): go.Error;

}