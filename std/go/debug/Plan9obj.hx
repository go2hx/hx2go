package go.debug;

@:go.Type({ name: "plan9obj", instanceName: "plan9obj.plan9obj", imports: ["debug/plan9obj"] })
extern class Plan9obj {

    @:native("Magic386") static var Magic386: go.GoInt;
    @:native("Magic64") static var Magic64: go.GoInt;
    @:native("MagicAMD64") static var MagicAMD64: go.GoInt;
    @:native("MagicARM") static var MagicARM: go.GoInt;

    @:native("NewFile") static function newFile(r: go.io.ReaderAt): go.Result<go.Pointer<go.debug.plan9obj.File>>;
    @:native("Open") static function open(name: String): go.Result<go.Pointer<go.debug.plan9obj.File>>;

}