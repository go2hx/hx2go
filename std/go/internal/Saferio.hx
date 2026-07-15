package go.internal;

@:go.Type({ name: "saferio", instanceName: "saferio.saferio", imports: ["internal/saferio"] })
extern class Saferio {

    @:native("ReadData") static function readData(r: go.io.Reader, n: go.UInt64): go.Result<go.Slice<go.Byte>>;
    @:native("ReadDataAt") static function readDataAt(r: go.io.ReaderAt, n: go.UInt64, off: go.Int64): go.Result<go.Slice<go.Byte>>;
    @:native("SliceCap") static function sliceCap<E: Dynamic>(c: go.UInt64): go.GoInt;
    @:native("SliceCapWithSize") static function sliceCapWithSize(size: go.UInt64, c: go.UInt64): go.GoInt;

}