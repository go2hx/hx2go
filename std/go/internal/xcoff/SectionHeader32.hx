package go.internal.xcoff;

@:structInit
@:go.Type({ name: "SectionHeader32", instanceName: "xcoff.SectionHeader32", imports: ["internal/xcoff"] })
extern class SectionHeader32 {

    @:native("Sname") var sname: go.GoArray<go.Byte, 8>;
    @:native("Spaddr") var spaddr: go.UInt32;
    @:native("Svaddr") var svaddr: go.UInt32;
    @:native("Ssize") var ssize: go.UInt32;
    @:native("Sscnptr") var sscnptr: go.UInt32;
    @:native("Srelptr") var srelptr: go.UInt32;
    @:native("Slnnoptr") var slnnoptr: go.UInt32;
    @:native("Snreloc") var snreloc: go.UInt16;
    @:native("Snlnno") var snlnno: go.UInt16;
    @:native("Sflags") var sflags: go.UInt32;

function new(sname: go.GoArray<go.Byte, 8>, spaddr: go.UInt32, svaddr: go.UInt32, ssize: go.UInt32, sscnptr: go.UInt32, srelptr: go.UInt32, slnnoptr: go.UInt32, snreloc: go.UInt16, snlnno: go.UInt16, sflags: go.UInt32);

}