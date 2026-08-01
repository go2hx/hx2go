package go.go.printer;

@:structInit
@:go.Type({ name: "trimmer", instanceName: "printer.trimmer", imports: ["go/printer"] })
extern class Trimmer {

    @:native("Write") function write(data: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}