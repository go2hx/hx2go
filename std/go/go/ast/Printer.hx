package go.go.ast;

@:structInit
@:go.Type({ name: "printer", instanceName: "ast.printer", imports: ["go/ast"] })
extern class Printer {

    @:native("Write") function write(data: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}