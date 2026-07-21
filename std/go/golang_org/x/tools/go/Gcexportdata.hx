package go.golang_org.x.tools.go;

@:go.Type({ name: "gcexportdata", instanceName: "gcexportdata.gcexportdata", imports: ["golang.org/x/tools/go/gcexportdata"] })
extern class Gcexportdata {

    @:go.Tuple("filename", "path") @:native("Find") static function find(importPath: String, srcDir: String): (go.Tuple<{ filename: String, path: String }>);
    @:native("NewImporter") static function newImporter(fset: go.Pointer<go.go.token.FileSet>, imports: go.Map<String, go.Pointer<go.go.types.Package>>): (go.go.types.ImporterFrom);
    @:native("NewReader") static function newReader(r: go.io.Reader): (go.Result<go.io.Reader>);
    @:native("Read") static function read(_in: go.io.Reader, fset: go.Pointer<go.go.token.FileSet>, imports: go.Map<String, go.Pointer<go.go.types.Package>>, path: String): (go.Result<go.Pointer<go.go.types.Package>>);
    @:native("ReadBundle") static function readBundle(_in: go.io.Reader, fset: go.Pointer<go.go.token.FileSet>, imports: go.Map<String, go.Pointer<go.go.types.Package>>): (go.Result<go.Slice<go.Pointer<go.go.types.Package>>>);
    @:native("Write") static function write(out: go.io.Writer, fset: go.Pointer<go.go.token.FileSet>, pkg: go.Pointer<go.go.types.Package>): (go.Error);
    @:native("WriteBundle") static function writeBundle(out: go.io.Writer, fset: go.Pointer<go.go.token.FileSet>, pkgs: go.Slice<go.Pointer<go.go.types.Package>>): (go.Error);

}