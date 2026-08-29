package go.debug.dwarf;

/**
    A Class is the DWARF 4 class of an attribute value.
    
    In general, a given attribute's value may take on one of several
    possible classes defined by DWARF, each of which leads to a
    slightly different interpretation of the attribute.
    
    DWARF version 4 distinguishes attribute value classes more finely
    than previous versions of DWARF. The reader will disambiguate
    coarser classes from earlier versions of DWARF into the appropriate
    DWARF 4 class. For example, DWARF 2 uses "constant" for constants
    as well as all types of section offsets, but the reader will
    canonicalize attributes in DWARF 2 files that refer to section
    offsets to one of the Class*Ptr classes, even though these classes
    were only defined in DWARF 3.
**/
@:go.Type({ name: "Class", instanceName: "dwarf.Class", imports: ["debug/dwarf"] })
extern typedef Class = haxe.extern.EitherType<go.GoInt, {
    @:native("GoString") function goString(): (String);
    @:native("String") function string(): (String);

}>