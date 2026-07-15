package go.internal;

@:go.Type({ name: "testhash", instanceName: "testhash.testhash", imports: ["internal/testhash"] })
extern class Testhash {

    @:native("TestHash") static function testHash(t: go.Pointer<go.testing.T>, mh: go.internal.testhash.MakeHash): Void;
    @:native("TestHashWithoutClone") static function testHashWithoutClone(t: go.Pointer<go.testing.T>, mh: go.internal.testhash.MakeHash): Void;

}