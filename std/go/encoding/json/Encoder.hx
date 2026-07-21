package go.encoding.json;

@:structInit
@:go.Type({ name: "Encoder", instanceName: "json.Encoder", imports: ["encoding/json"] })
extern class Encoder {

    @:native("Encode") function encode(v: Dynamic): (go.Error);
    @:native("SetEscapeHTML") function setEscapeHTML(on: Bool): Void;
    @:native("SetIndent") function setIndent(prefix: String, indent: String): Void;

}