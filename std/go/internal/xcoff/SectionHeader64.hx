package go.internal.xcoff;

@:structInit
@:go.Type({ name: "SectionHeader64", instanceName: "xcoff.SectionHeader64", imports: ["internal/xcoff"] })
extern class SectionHeader64 {

    @:native("Sname") var sname: go.GoArray<go.Byte, 8>;
    @:native("Spaddr") var spaddr: go.UInt64;
    @:native("Svaddr") var svaddr: go.UInt64;
    @:native("Ssize") var ssize: go.UInt64;
    @:native("Sscnptr") var sscnptr: go.UInt64;
    @:native("Srelptr") var srelptr: go.UInt64;
    @:native("Slnnoptr") var slnnoptr: go.UInt64;
    @:native("Snreloc") var snreloc: go.UInt32;
    @:native("Snlnno") var snlnno: go.UInt32;
    @:native("Sflags") var sflags: go.UInt32;
    @:native("Spad") var spad: go.UInt32;

function new(sname: go.GoArray<go.Byte, 8>, spaddr: go.UInt64, svaddr: go.UInt64, ssize: go.UInt64, sscnptr: go.UInt64, srelptr: go.UInt64, slnnoptr: go.UInt64, snreloc: go.UInt32, snlnno: go.UInt32, sflags: go.UInt32, spad: go.UInt32);

}