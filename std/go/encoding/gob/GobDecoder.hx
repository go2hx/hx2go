package go.encoding.gob;

@:go.Type({ name: "GobDecoder", instanceName: "gob.GobDecoder", imports: ["encoding/gob"] })
extern typedef GobDecoder = {

    @:native("GobDecode") function gobDecode(p0: go.Slice<go.Byte>): go.Error;

}