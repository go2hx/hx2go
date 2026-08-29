package go.hash;

/**
    Package crc32 implements the 32-bit cyclic redundancy check, or CRC-32,
    checksum. See https://en.wikipedia.org/wiki/Cyclic_redundancy_check for
    information.
    
    Polynomials are represented in LSB-first form also known as reversed representation.
    
    See https://en.wikipedia.org/wiki/Mathematics_of_cyclic_redundancy_checks#Reversed_representations_and_reciprocal_polynomials
    for information.
**/
@:go.Type({ name: "crc32", instanceName: "crc32.crc32", imports: ["hash/crc32"] })
extern class Crc32 {

    /**
        Predefined polynomials.
    **/
    @:native("Castagnoli") static var castagnoli: go.GoInt;
    /**
        Predefined polynomials.
    **/
    @:native("IEEE") static var IEEE: go.GoInt;
    /**
        Predefined polynomials.
    **/
    @:native("Koopman") static var koopman: go.GoInt;
    /**
        The size of a CRC-32 checksum in bytes.
    **/
    @:native("Size") static var size: go.GoInt;

    /**
        IEEETable is the table for the [IEEE] polynomial.
    **/
    @:native("IEEETable") static var iEEETable: go.Pointer<go.hash.crc32.Table>;

    /**
        Checksum returns the CRC-32 checksum of data
        using the polynomial represented by the [Table].
    **/
    @:native("Checksum") static function checksum(data: go.Slice<go.Byte>, tab: go.Pointer<go.hash.crc32.Table>): (go.UInt32);
    /**
        ChecksumIEEE returns the CRC-32 checksum of data
        using the [IEEE] polynomial.
    **/
    @:native("ChecksumIEEE") static function checksumIEEE(data: go.Slice<go.Byte>): (go.UInt32);
    /**
        MakeTable returns a [Table] constructed from the specified polynomial.
        The contents of this [Table] must not be modified.
    **/
    @:native("MakeTable") static function makeTable(poly: go.UInt32): (go.Pointer<go.hash.crc32.Table>);
    /**
        New creates a new [hash.Hash32] computing the CRC-32 checksum using the
        polynomial represented by the [Table]. Its Sum method will lay the
        value out in big-endian byte order. The returned Hash32 also
        implements [encoding.BinaryMarshaler] and [encoding.BinaryUnmarshaler] to
        marshal and unmarshal the internal state of the hash.
    **/
    @:native("New") static function _new(tab: go.Pointer<go.hash.crc32.Table>): (go.hash.Hash32);
    /**
        NewIEEE creates a new [hash.Hash32] computing the CRC-32 checksum using
        the [IEEE] polynomial. Its Sum method will lay the value out in
        big-endian byte order. The returned Hash32 also implements
        [encoding.BinaryMarshaler] and [encoding.BinaryUnmarshaler] to marshal
        and unmarshal the internal state of the hash.
    **/
    @:native("NewIEEE") static function newIEEE(): (go.hash.Hash32);
    /**
        Update returns the result of adding the bytes in p to the crc.
    **/
    @:native("Update") static function update(crc: go.UInt32, tab: go.Pointer<go.hash.crc32.Table>, p: go.Slice<go.Byte>): (go.UInt32);

}