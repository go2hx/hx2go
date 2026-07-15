package go.internal.coverage;

@:go.Type({ name: "stringtab", instanceName: "stringtab.stringtab", imports: ["internal/coverage/stringtab"] })
extern class Stringtab {

    @:native("NewReader") static function newReader(r: go.Pointer<go.internal.coverage.slicereader.Reader>): go.Pointer<go.internal.coverage.stringtab.Reader>;

}