package go.debug.dwarf;

/**
    A StructField represents a field in a struct, union, or C++ class type.
    
    # Bit Fields
    
    The BitSize, BitOffset, and DataBitOffset fields describe the bit
    size and offset of data members declared as bit fields in C/C++
    struct/union/class types.
    
    BitSize is the number of bits in the bit field.
    
    DataBitOffset, if non-zero, is the number of bits from the start of
    the enclosing entity (e.g. containing struct/class/union) to the
    start of the bit field. This corresponds to the DW_AT_data_bit_offset
    DWARF attribute that was introduced in DWARF 4.
    
    BitOffset, if non-zero, is the number of bits between the most
    significant bit of the storage unit holding the bit field to the
    most significant bit of the bit field. Here "storage unit" is the
    type name before the bit field (for a field "unsigned x:17", the
    storage unit is "unsigned"). BitOffset values can vary depending on
    the endianness of the system. BitOffset corresponds to the
    DW_AT_bit_offset DWARF attribute that was deprecated in DWARF 4 and
    removed in DWARF 5.
    
    At most one of DataBitOffset and BitOffset will be non-zero;
    DataBitOffset/BitOffset will only be non-zero if BitSize is
    non-zero. Whether a C compiler uses one or the other
    will depend on compiler vintage and command line options.
    
    Here is an example of C/C++ bit field use, along with what to
    expect in terms of DWARF bit offset info. Consider this code:
    
    	struct S {
    		int q;
    		int j:5;
    		int k:6;
    		int m:5;
    		int n:8;
    	} s;
    
    For the code above, one would expect to see the following for
    DW_AT_bit_offset values (using GCC 8):
    
    	       Little   |     Big
    	       Endian   |    Endian
    	                |
    	"j":     27     |     0
    	"k":     21     |     5
    	"m":     16     |     11
    	"n":     8      |     16
    
    Note that in the above the offsets are purely with respect to the
    containing storage unit for j/k/m/n -- these values won't vary based
    on the size of prior data members in the containing struct.
    
    If the compiler emits DW_AT_data_bit_offset, the expected values
    would be:
    
    	"j":     32
    	"k":     37
    	"m":     43
    	"n":     48
    
    Here the value 32 for "j" reflects the fact that the bit field is
    preceded by other data members (recall that DW_AT_data_bit_offset
    values are relative to the start of the containing struct). Hence
    DW_AT_data_bit_offset values can be quite large for structs with
    many fields.
    
    DWARF also allow for the possibility of base types that have
    non-zero bit size and bit offset, so this information is also
    captured for base types, but it is worth noting that it is not
    possible to trigger this behavior using mainstream languages.
**/
@:structInit
@:go.Type({ name: "StructField", instanceName: "dwarf.StructField", imports: ["debug/dwarf"] })
extern class StructField {

    @:native("Name") var name: String;
    @:native("Type") var type: go.debug.dwarf.Type;
    @:native("ByteOffset") var byteOffset: go.Int64;
    @:native("ByteSize") var byteSize: go.Int64;
    @:native("BitOffset") var bitOffset: go.Int64;
    @:native("DataBitOffset") var dataBitOffset: go.Int64;
    @:native("BitSize") var bitSize: go.Int64;

    function new(name: String="", type: go.debug.dwarf.Type=null, byteOffset: go.Int64=0, byteSize: go.Int64=0, bitOffset: go.Int64=0, dataBitOffset: go.Int64=0, bitSize: go.Int64=0);

}