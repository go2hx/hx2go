package go.internal.xcoff;

@:structInit
@:go.Type({ name: "ImportedSymbol", instanceName: "xcoff.ImportedSymbol", imports: ["internal/xcoff"] })
extern class ImportedSymbol {

    @:native("Name") var name: String;
    @:native("Library") var library: String;

function new(name: String, library: String);

}