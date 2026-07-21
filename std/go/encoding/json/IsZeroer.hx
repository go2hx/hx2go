package go.encoding.json;

@:go.Type({ name: "isZeroer", instanceName: "json.isZeroer", imports: ["encoding/json"] })
extern typedef IsZeroer = {

    @:native("IsZero") function isZero(): (Bool);

}