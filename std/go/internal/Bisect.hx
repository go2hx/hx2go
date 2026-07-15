package go.internal;

@:go.Type({ name: "bisect", instanceName: "bisect.bisect", imports: ["internal/bisect"] })
extern class Bisect {

    @:native("AppendMarker") static function appendMarker(dst: go.Slice<go.Byte>, id: go.UInt64): go.Slice<go.Byte>;
    @:go.Tuple("short", "id", "ok") @:native("CutMarker") static function cutMarker(line: String): go.Tuple<{ short: String, id: go.UInt64, ok: Bool }>;
    @:native("Hash") static function hash(data: haxe.Rest<Dynamic>): go.UInt64;
    @:native("Marker") static function marker(id: go.UInt64): String;
    @:native("New") static function _new(pattern: String): go.Result<go.Pointer<go.internal.bisect.Matcher>>;
    @:native("PrintMarker") static function printMarker(w: go.internal.bisect.Writer, h: go.UInt64): go.Error;

}