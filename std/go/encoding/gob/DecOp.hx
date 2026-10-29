package go.encoding.gob;

@:go.Type({ name: "decOp", instanceName: "gob.decOp", imports: ["encoding/gob"] })
extern typedef DecOp = (i: go.Pointer<go.encoding.gob.DecInstr>, state: go.Pointer<go.encoding.gob.DecoderState>, v: go.reflect.Value) -> Void