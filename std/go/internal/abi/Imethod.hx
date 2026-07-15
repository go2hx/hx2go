package go.internal.abi;

@:structInit
@:go.Type({ name: "Imethod", instanceName: "abi.Imethod", imports: ["internal/abi"] })
extern class Imethod {

    @:native("Name") var name: go.internal.abi.NameOff;
    @:native("Typ") var typ: go.internal.abi.TypeOff;

function new(name: go.internal.abi.NameOff, typ: go.internal.abi.TypeOff);

}