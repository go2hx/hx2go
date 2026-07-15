package go.fmt;

@:go.Type({ name: "State", instanceName: "fmt.State", imports: ["fmt"] })
extern typedef State = {

    @:native("Flag") function flag(c: go.GoInt): Bool;
    @:go.Tuple("prec", "ok") @:native("Precision") function precision(): go.Tuple<{ prec: go.GoInt, ok: Bool }>;
    @:go.Tuple("wid", "ok") @:native("Width") function width(): go.Tuple<{ wid: go.GoInt, ok: Bool }>;
    @:native("Write") function write(b: go.Slice<go.Byte>): go.Result<go.GoInt>;

}