package go.fmt;

@:structInit
@:go.Type({ name: "pp", instanceName: "fmt.pp", imports: ["fmt"] })
extern class Pp {

    @:native("Flag") function flag(b: go.GoInt): (Bool);
    @:go.Tuple("prec", "ok") @:native("Precision") function precision(): (go.Tuple<{ prec: go.GoInt, ok: Bool }>);
    @:go.Tuple("wid", "ok") @:native("Width") function width(): (go.Tuple<{ wid: go.GoInt, ok: Bool }>);
    @:native("Write") function write(b: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("WriteString") function writeString(s: String): (go.Result<go.GoInt>);

}