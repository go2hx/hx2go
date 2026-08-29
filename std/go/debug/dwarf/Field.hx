package go.debug.dwarf;

/**
    A Field is a single attribute/value pair in an [Entry].
    
    A value can be one of several "attribute classes" defined by DWARF.
    The Go types corresponding to each class are:
    
    	DWARF class       Go type        Class
    	-----------       -------        -----
    	address           uint64         ClassAddress
    	block             []byte         ClassBlock
    	constant          int64          ClassConstant
    	flag              bool           ClassFlag
    	reference
    	  to info         dwarf.Offset   ClassReference
    	  to type unit    uint64         ClassReferenceSig
    	string            string         ClassString
    	exprloc           []byte         ClassExprLoc
    	lineptr           int64          ClassLinePtr
    	loclistptr        int64          ClassLocListPtr
    	macptr            int64          ClassMacPtr
    	rangelistptr      int64          ClassRangeListPtr
    
    For unrecognized or vendor-defined attributes, [Class] may be
    [ClassUnknown].
**/
@:structInit
@:go.Type({ name: "Field", instanceName: "dwarf.Field", imports: ["debug/dwarf"] })
extern class Field {

    @:native("Attr") var attr: go.debug.dwarf.Attr;
    @:native("Val") var val: Dynamic;
    @:native("Class") var _class: go.debug.dwarf.Class;

    function new(attr: go.debug.dwarf.Attr=cast 0, val: Dynamic=null, _class: go.debug.dwarf.Class=cast 0);

}