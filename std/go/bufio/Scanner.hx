package go.bufio;

@:structInit
@:go.Type({ name: "Scanner", instanceName: "bufio.Scanner", imports: ["bufio"] })
extern class Scanner {

    @:native("Buffer") function buffer(buf: go.Slice<go.Byte>, max: go.GoInt): Void;
    @:native("Bytes") function bytes(): go.Slice<go.Byte>;
    @:native("Err") function err(): go.Error;
    @:native("Scan") function scan(): Bool;
    @:native("Split") function split(split: go.bufio.SplitFunc): Void;
    @:native("Text") function text(): String;

}