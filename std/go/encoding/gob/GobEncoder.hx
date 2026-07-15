package go.encoding.gob;

@:go.Type({ name: "GobEncoder", instanceName: "gob.GobEncoder", imports: ["encoding/gob"] })
extern typedef GobEncoder = {

    @:native("GobEncode") function gobEncode(): go.Result<go.Slice<go.Byte>>;

}