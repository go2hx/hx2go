package go.encoding.json.v2;

@:go.Type({ name: "unmarshaler", instanceName: "json.unmarshaler", imports: ["encoding/json/v2"] })
extern typedef Unmarshaler_ = (p0: go.Pointer<go.encoding.json.jsontext.Decoder>, p1: go.encoding.json.v2.AddressableValue, p2: go.Pointer<Dynamic>) -> (go.Error)