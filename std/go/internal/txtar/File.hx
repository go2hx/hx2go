package go.internal.txtar;

@:structInit
@:go.Type({ name: "File", instanceName: "txtar.File", imports: ["internal/txtar"] })
extern class File {

    @:native("Name") var name: String;
    @:native("Data") var data: go.Slice<go.Byte>;

function new(name: String, data: go.Slice<go.Byte>);

}