package go.go.printer;

@:structInit
@:go.Type({ name: "sizeCounter", instanceName: "printer.sizeCounter", imports: ["go/printer"] })
extern class SizeCounter {

    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}