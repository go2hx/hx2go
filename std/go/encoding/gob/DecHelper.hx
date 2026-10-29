package go.encoding.gob;

@:go.Type({ name: "decHelper", instanceName: "gob.decHelper", imports: ["encoding/gob"] })
extern typedef DecHelper = (state: go.Pointer<go.encoding.gob.DecoderState>, v: go.reflect.Value, length: go.GoInt, ovfl: go.Error) -> (Bool)