package go.encoding.json.v2;

@:structInit
@:go.Type({ name: "unmarshalersOption", instanceName: "json.unmarshalersOption", imports: ["encoding/json/v2"] })
extern class UnmarshalersOption {

    @:native("JSONOptions") function jSONOptions(p0: Dynamic): Void;

}