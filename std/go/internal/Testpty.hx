package go.internal;

@:go.Type({ name: "testpty", instanceName: "testpty.testpty", imports: ["internal/testpty"] })
extern class Testpty {

    @:go.Tuple("pty", "processTTY", "err") @:native("Open") static function open(): go.Tuple<{ pty: go.Pointer<go.os.File>, processTTY: String, err: go.Error }>;

}