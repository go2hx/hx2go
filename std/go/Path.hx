package go;

@:go.Type({ name: "path", instanceName: "path.path", imports: ["path"] })
extern class Path {

    @:native("Base") static function base(path: String): String;
    @:native("Clean") static function clean(path: String): String;
    @:native("Dir") static function dir(path: String): String;
    @:native("Ext") static function ext(path: String): String;
    @:native("IsAbs") static function isAbs(path: String): Bool;
    @:native("Join") static function join(elem: haxe.Rest<String>): String;
    @:native("Match") static function match(pattern: String, name: String): go.Result<Bool>;
    @:go.Tuple("dir", "file") @:native("Split") static function split(path: String): go.Tuple<{ dir: String, file: String }>;

}