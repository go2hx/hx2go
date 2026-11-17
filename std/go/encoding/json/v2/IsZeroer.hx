package go.encoding.json.v2;

@:go.Type({ name: "isZeroer", instanceName: "json.isZeroer", imports: ["encoding/json/v2"] })
extern typedef IsZeroer = {

    @:native("IsZero") function isZero(): (Bool);

}