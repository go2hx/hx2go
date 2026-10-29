package go.encoding.json.v2;

@:go.Type({ name: "marshaler", instanceName: "json.marshaler", imports: ["encoding/json/v2"] })
extern typedef Marshaler_ = (p0: go.Pointer<go.encoding.json.jsontext.Encoder>, p1: go.encoding.json.v2.AddressableValue, p2: go.Pointer<Dynamic>) -> (go.Error)