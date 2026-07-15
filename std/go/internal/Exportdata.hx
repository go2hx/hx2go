package go.internal;

@:go.Type({ name: "exportdata", instanceName: "exportdata.exportdata", imports: ["internal/exportdata"] })
extern class Exportdata {

    @:native("FindPackageDefinition") static function findPackageDefinition(r: go.Pointer<go.bufio.Reader>): go.Result<go.GoInt>;
    @:go.Tuple("filename", "id", "err") @:native("FindPkg") static function findPkg(path: String, srcDir: String): go.Tuple<{ filename: String, id: String, err: go.Error }>;
    @:native("ReadExportDataHeader") static function readExportDataHeader(r: go.Pointer<go.bufio.Reader>): go.Result<go.GoInt>;
    @:go.Tuple("objapi", "headers", "err") @:native("ReadObjectHeaders") static function readObjectHeaders(r: go.Pointer<go.bufio.Reader>): go.Tuple<{ objapi: String, headers: go.Slice<String>, err: go.Error }>;
    @:native("ReadUnified") static function readUnified(r: go.Pointer<go.bufio.Reader>): go.Result<go.Slice<go.Byte>>;

}