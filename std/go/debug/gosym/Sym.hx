package go.debug.gosym;

/**
    A Sym represents a single symbol table entry.
**/
@:structInit
@:go.Type({ name: "Sym", instanceName: "gosym.Sym", imports: ["debug/gosym"] })
extern class Sym {

    @:native("Value") var value: go.UInt64;
    @:native("Type") var type: go.Byte;
    @:native("Name") var name: String;
    @:native("GoType") var goType: go.UInt64;
    @:native("Func") var func: go.Pointer<go.debug.gosym.Func>;

    function new(value: go.UInt64=0, type: go.Byte=0, name: String="", goType: go.UInt64=0, func: go.Pointer<go.debug.gosym.Func>=null);

    /**
        BaseName returns the symbol name without the package or receiver name.
    **/
    @:native("BaseName") function baseName(): (String);
    /**
        PackageName returns the package part of the symbol name,
        or the empty string if there is none.
    **/
    @:native("PackageName") function packageName(): (String);
    /**
        ReceiverName returns the receiver type name of this symbol,
        or the empty string if there is none.  A receiver name is only detected in
        the case that s.Name is fully-specified with a package name.
    **/
    @:native("ReceiverName") function receiverName(): (String);
    /**
        Static reports whether this symbol is static (not visible outside its file).
    **/
    @:native("Static") function _static(): (Bool);

}