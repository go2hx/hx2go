package go.encoding.gob;

@:structInit
@:go.Type({ name: "Encoder", instanceName: "gob.Encoder", imports: ["encoding/gob"] })
extern class Encoder {

    @:native("Encode") function encode(e: Dynamic): go.Error;
    @:native("EncodeValue") function encodeValue(value: go.reflect.Value): go.Error;

}