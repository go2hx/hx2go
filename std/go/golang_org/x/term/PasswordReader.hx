package go.golang_org.x.term;

@:go.Type({ name: "passwordReader", instanceName: "term.passwordReader", imports: ["golang.org/x/term"] })
extern typedef PasswordReader = haxe.extern.EitherType<go.GoInt, {
    @:native("Read") function read(buf: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}>