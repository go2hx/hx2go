package go.testing;

@:go.Type({ name: "fstest", instanceName: "fstest.fstest", imports: ["testing/fstest"] })
extern class Fstest {

    @:native("TestFS") static function testFS(fsys: go.io.fs.FS, expected: haxe.Rest<String>): go.Error;

}