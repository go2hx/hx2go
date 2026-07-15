package go.testing;

@:go.Type({ name: "synctest", instanceName: "synctest.synctest", imports: ["testing/synctest"] })
extern class Synctest {

    @:native("Test") static function test(t: go.Pointer<go.testing.T>, f: (p0: go.Pointer<go.testing.T>) -> Void): Void;
    @:native("Wait") static function wait(): Void;

}