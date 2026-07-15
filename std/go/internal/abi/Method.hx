package go.internal.abi;

@:structInit
@:go.Type({ name: "Method", instanceName: "abi.Method", imports: ["internal/abi"] })
extern class Method {

    @:native("Name") var name: go.internal.abi.NameOff;
    @:native("Mtyp") var mtyp: go.internal.abi.TypeOff;
    @:native("Ifn") var ifn: go.internal.abi.TextOff;
    @:native("Tfn") var tfn: go.internal.abi.TextOff;

function new(name: go.internal.abi.NameOff, mtyp: go.internal.abi.TypeOff, ifn: go.internal.abi.TextOff, tfn: go.internal.abi.TextOff);

}