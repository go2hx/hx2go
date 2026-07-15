package go.internal;

@:go.Type({ name: "byteorder", instanceName: "byteorder.byteorder", imports: ["internal/byteorder"] })
extern class Byteorder {

    @:native("BEAppendUint16") static function bEAppendUint16(b: go.Slice<go.Byte>, v: go.UInt16): go.Slice<go.Byte>;
    @:native("BEAppendUint32") static function bEAppendUint32(b: go.Slice<go.Byte>, v: go.UInt32): go.Slice<go.Byte>;
    @:native("BEAppendUint64") static function bEAppendUint64(b: go.Slice<go.Byte>, v: go.UInt64): go.Slice<go.Byte>;
    @:native("BEPutUint16") static function bEPutUint16(b: go.Slice<go.Byte>, v: go.UInt16): Void;
    @:native("BEPutUint32") static function bEPutUint32(b: go.Slice<go.Byte>, v: go.UInt32): Void;
    @:native("BEPutUint64") static function bEPutUint64(b: go.Slice<go.Byte>, v: go.UInt64): Void;
    @:native("BEUint16") static function bEUint16(b: go.Slice<go.Byte>): go.UInt16;
    @:native("BEUint32") static function bEUint32(b: go.Slice<go.Byte>): go.UInt32;
    @:native("BEUint64") static function bEUint64(b: go.Slice<go.Byte>): go.UInt64;
    @:native("LEAppendUint16") static function lEAppendUint16(b: go.Slice<go.Byte>, v: go.UInt16): go.Slice<go.Byte>;
    @:native("LEAppendUint32") static function lEAppendUint32(b: go.Slice<go.Byte>, v: go.UInt32): go.Slice<go.Byte>;
    @:native("LEAppendUint64") static function lEAppendUint64(b: go.Slice<go.Byte>, v: go.UInt64): go.Slice<go.Byte>;
    @:native("LEPutUint16") static function lEPutUint16(b: go.Slice<go.Byte>, v: go.UInt16): Void;
    @:native("LEPutUint32") static function lEPutUint32(b: go.Slice<go.Byte>, v: go.UInt32): Void;
    @:native("LEPutUint64") static function lEPutUint64(b: go.Slice<go.Byte>, v: go.UInt64): Void;
    @:native("LEUint16") static function lEUint16(b: go.Slice<go.Byte>): go.UInt16;
    @:native("LEUint32") static function lEUint32(b: go.Slice<go.Byte>): go.UInt32;
    @:native("LEUint64") static function lEUint64(b: go.Slice<go.Byte>): go.UInt64;

}