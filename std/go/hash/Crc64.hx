package go.hash;

/**
    Package crc64 implements the 64-bit cyclic redundancy check, or CRC-64,
    checksum. See https://en.wikipedia.org/wiki/Cyclic_redundancy_check for
    information.
**/
@:go.Type({ name: "crc64", instanceName: "crc64.crc64", imports: ["hash/crc64"] })
extern class Crc64 {

    /**
        Predefined polynomials.
    **/
    @:native("ECMA") static var ECMA: go.GoInt;
    /**
        Predefined polynomials.
    **/
    @:native("ISO") static var ISO: go.GoInt;
    /**
        The size of a CRC-64 checksum in bytes.
    **/
    @:native("Size") static var size: go.GoInt;

    /**
        Checksum returns the CRC-64 checksum of data
        using the polynomial represented by the [Table].
    **/
    @:native("Checksum") static function checksum(data: go.Slice<go.Byte>, tab: go.Pointer<go.hash.crc64.Table>): (go.UInt64);
    /**
        MakeTable returns a [Table] constructed from the specified polynomial.
        The contents of this [Table] must not be modified.
    **/
    @:native("MakeTable") static function makeTable(poly: go.UInt64): (go.Pointer<go.hash.crc64.Table>);
    /**
        New creates a new hash.Hash64 computing the CRC-64 checksum using the
        polynomial represented by the [Table]. Its Sum method will lay the
        value out in big-endian byte order. The returned Hash64 also
        implements [encoding.BinaryMarshaler] and [encoding.BinaryUnmarshaler] to
        marshal and unmarshal the internal state of the hash.
    **/
    @:native("New") static function _new(tab: go.Pointer<go.hash.crc64.Table>): (go.hash.Hash64);
    /**
        Update returns the result of adding the bytes in p to the crc.
    **/
    @:native("Update") static function update(crc: go.UInt64, tab: go.Pointer<go.hash.crc64.Table>, p: go.Slice<go.Byte>): (go.UInt64);

}