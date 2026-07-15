package go.internal.runtime;

@:go.Type({ name: "gc", instanceName: "gc.gc", imports: ["internal/runtime/gc"] })
extern class Gc {

    @:native("LargeSizeDiv") static var LargeSizeDiv: go.GoInt;
    @:native("MallocHeaderSize") static var MallocHeaderSize: go.GoInt;
    @:native("MaxObjsPerSpan") static var MaxObjsPerSpan: go.GoInt;
    @:native("MaxSizeClassNPages") static var MaxSizeClassNPages: go.GoInt;
    @:native("MaxSmallSize") static var MaxSmallSize: go.GoInt;
    @:native("MinHeapAlign") static var MinHeapAlign: go.GoInt;
    @:native("MinSizeForMallocHeader") static var MinSizeForMallocHeader: go.GoInt;
    @:native("NumSizeClasses") static var NumSizeClasses: go.GoInt;
    @:native("PageShift") static var PageShift: go.GoInt;
    @:native("PageSize") static var PageSize: go.GoInt;
    @:native("PageWords") static var PageWords: go.GoInt;
    @:native("SmallSizeDiv") static var SmallSizeDiv: go.GoInt;
    @:native("SmallSizeMax") static var SmallSizeMax: go.GoInt;
    @:native("TinySize") static var TinySize: go.GoInt;
    @:native("TinySizeClass") static var TinySizeClass: go.GoInt;

    @:native("SizeClassToDivMagic") static var SizeClassToDivMagic: go.GoArray<go.UInt32, 68>;
    @:native("SizeClassToNPages") static var SizeClassToNPages: go.GoArray<go.UInt8, 68>;
    @:native("SizeClassToSize") static var SizeClassToSize: go.GoArray<go.UInt16, 68>;
    @:native("SizeToSizeClass128") static var SizeToSizeClass128: go.GoArray<go.UInt8, 249>;
    @:native("SizeToSizeClass8") static var SizeToSizeClass8: go.GoArray<go.UInt8, 129>;

}