package go;

@:go.Type({ name: "io", instanceName: "io.io", imports: ["io"] })
extern class Io {

    @:native("SeekCurrent") static var SeekCurrent: go.GoInt;
    @:native("SeekEnd") static var SeekEnd: go.GoInt;
    @:native("SeekStart") static var SeekStart: go.GoInt;

    @:native("Discard") static var Discard: go.io.Writer;

    @:native("Copy") static function copy(dst: go.io.Writer, src: go.io.Reader): go.Result<go.Int64>;
    @:native("CopyBuffer") static function copyBuffer(dst: go.io.Writer, src: go.io.Reader, buf: go.Slice<go.Byte>): go.Result<go.Int64>;
    @:native("CopyN") static function copyN(dst: go.io.Writer, src: go.io.Reader, n: go.Int64): go.Result<go.Int64>;
    @:native("LimitReader") static function limitReader(r: go.io.Reader, n: go.Int64): go.io.Reader;
    @:native("MultiReader") static function multiReader(readers: haxe.Rest<go.io.Reader>): go.io.Reader;
    @:native("MultiWriter") static function multiWriter(writers: haxe.Rest<go.io.Writer>): go.io.Writer;
    @:native("NewOffsetWriter") static function newOffsetWriter(w: go.io.WriterAt, off: go.Int64): go.Pointer<go.io.OffsetWriter>;
    @:native("NewSectionReader") static function newSectionReader(r: go.io.ReaderAt, off: go.Int64, n: go.Int64): go.Pointer<go.io.SectionReader>;
    @:native("NopCloser") static function nopCloser(r: go.io.Reader): go.io.ReadCloser;
    @:go.Tuple("p0", "p1") @:native("Pipe") static function pipe(): go.Tuple<{ p0: go.Pointer<go.io.PipeReader>, p1: go.Pointer<go.io.PipeWriter> }>;
    @:native("ReadAll") static function readAll(r: go.io.Reader): go.Result<go.Slice<go.Byte>>;
    @:native("ReadAtLeast") static function readAtLeast(r: go.io.Reader, buf: go.Slice<go.Byte>, min: go.GoInt): go.Result<go.GoInt>;
    @:native("ReadFull") static function readFull(r: go.io.Reader, buf: go.Slice<go.Byte>): go.Result<go.GoInt>;
    @:native("TeeReader") static function teeReader(r: go.io.Reader, w: go.io.Writer): go.io.Reader;
    @:native("WriteString") static function writeString(w: go.io.Writer, s: String): go.Result<go.GoInt>;

}