package go.golang_org.x;

@:go.Type({ name: "term", instanceName: "term.term", imports: ["golang.org/x/term"] })
extern class Term {

    @:go.Tuple("width", "height", "err") @:native("GetSize") static function getSize(fd: go.GoInt): (go.Tuple<{ width: go.GoInt, height: go.GoInt, err: go.Error }>);
    @:native("GetState") static function getState(fd: go.GoInt): (go.Result<go.Pointer<go.golang_org.x.term.State>>);
    @:native("IsTerminal") static function isTerminal(fd: go.GoInt): (Bool);
    @:native("MakeRaw") static function makeRaw(fd: go.GoInt): (go.Result<go.Pointer<go.golang_org.x.term.State>>);
    @:native("NewTerminal") static function newTerminal(c: go.io.ReadWriter, prompt: String): (go.Pointer<go.golang_org.x.term.Terminal>);
    @:native("ReadPassword") static function readPassword(fd: go.GoInt): (go.Result<go.Slice<go.Byte>>);
    @:native("Restore") static function restore(fd: go.GoInt, oldState: go.Pointer<go.golang_org.x.term.State>): (go.Error);

}