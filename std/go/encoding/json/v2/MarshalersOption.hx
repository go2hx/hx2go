package go.encoding.json.v2;

@:structInit
@:go.Type({ name: "marshalersOption", instanceName: "json.marshalersOption", imports: ["encoding/json/v2"] })
extern class MarshalersOption {

    @:native("JSONOptions") function jSONOptions(p0: Dynamic): Void;

}