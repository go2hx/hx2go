package go.debug;

@:go.Type({ name: "plan9obj", instanceName: "plan9obj.plan9obj", imports: ["debug/plan9obj"] })
extern class Plan9obj {

    @:native("Magic386") static var magic386: go.GoInt;
    @:native("Magic64") static var magic64: go.GoInt;
    @:native("MagicAMD64") static var magicAMD64: go.GoInt;
    @:native("MagicARM") static var magicARM: go.GoInt;

    @:native("NewFile") static function newFile(r: go.io.ReaderAt): (go.Result<go.Pointer<go.debug.plan9obj.File>>);
    @:native("Open") static function open(name: String): (go.Result<go.Pointer<go.debug.plan9obj.File>>);

}