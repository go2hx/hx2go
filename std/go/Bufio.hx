package go;

@:go.Type({ name: "bufio", instanceName: "bufio.bufio", imports: ["bufio"] })
extern class Bufio {

    @:native("MaxScanTokenSize") static var MaxScanTokenSize: go.GoInt;

    @:native("NewReadWriter") static function newReadWriter(r: go.Pointer<go.bufio.Reader>, w: go.Pointer<go.bufio.Writer>): go.Pointer<go.bufio.ReadWriter>;
    @:native("NewReader") static function newReader(rd: go.io.Reader): go.Pointer<go.bufio.Reader>;
    @:native("NewReaderSize") static function newReaderSize(rd: go.io.Reader, size: go.GoInt): go.Pointer<go.bufio.Reader>;
    @:native("NewScanner") static function newScanner(r: go.io.Reader): go.Pointer<go.bufio.Scanner>;
    @:native("NewWriter") static function newWriter(w: go.io.Writer): go.Pointer<go.bufio.Writer>;
    @:native("NewWriterSize") static function newWriterSize(w: go.io.Writer, size: go.GoInt): go.Pointer<go.bufio.Writer>;
    @:go.Tuple("advance", "token", "err") @:native("ScanBytes") static function scanBytes(data: go.Slice<go.Byte>, atEOF: Bool): go.Tuple<{ advance: go.GoInt, token: go.Slice<go.Byte>, err: go.Error }>;
    @:go.Tuple("advance", "token", "err") @:native("ScanLines") static function scanLines(data: go.Slice<go.Byte>, atEOF: Bool): go.Tuple<{ advance: go.GoInt, token: go.Slice<go.Byte>, err: go.Error }>;
    @:go.Tuple("advance", "token", "err") @:native("ScanRunes") static function scanRunes(data: go.Slice<go.Byte>, atEOF: Bool): go.Tuple<{ advance: go.GoInt, token: go.Slice<go.Byte>, err: go.Error }>;
    @:go.Tuple("advance", "token", "err") @:native("ScanWords") static function scanWords(data: go.Slice<go.Byte>, atEOF: Bool): go.Tuple<{ advance: go.GoInt, token: go.Slice<go.Byte>, err: go.Error }>;

}