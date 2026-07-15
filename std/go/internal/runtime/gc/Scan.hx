package go.internal.runtime.gc;

@:go.Type({ name: "scan", instanceName: "scan.scan", imports: ["internal/runtime/gc/scan"] })
extern class Scan {

    @:native("CanAVX512") static function canAVX512(): Bool;
    @:native("ExpandAVX512") static function expandAVX512(sizeClass: go.GoInt, packed: go.Pointer<go.internal.runtime.gc.ObjMask>, unpacked: go.Pointer<go.internal.runtime.gc.PtrMask>): Void;
    @:native("ExpandReference") static function expandReference(sizeClass: go.GoInt, packed: go.Pointer<go.internal.runtime.gc.ObjMask>, unpacked: go.Pointer<go.internal.runtime.gc.PtrMask>): Void;
    @:native("FilterNil") static function filterNil(bufp: go.Pointer<go.UIntPtr>, n: go.Int32): go.Int32;
    @:native("FilterNilAVX512") static function filterNilAVX512(bufp: go.Pointer<go.UIntPtr>, n: go.Int32): go.Int32;
    @:native("HasFastScanSpanPacked") static function hasFastScanSpanPacked(): Bool;
    @:native("ScanSpanPacked") static function scanSpanPacked(mem: go.unsafe.Pointer, bufp: go.Pointer<go.UIntPtr>, objMarks: go.Pointer<go.internal.runtime.gc.ObjMask>, sizeClass: go.UIntPtr, ptrMask: go.Pointer<go.internal.runtime.gc.PtrMask>): go.Int32;
    @:native("ScanSpanPackedAVX512") static function scanSpanPackedAVX512(mem: go.unsafe.Pointer, bufp: go.Pointer<go.UIntPtr>, objMarks: go.Pointer<go.internal.runtime.gc.ObjMask>, sizeClass: go.UIntPtr, ptrMask: go.Pointer<go.internal.runtime.gc.PtrMask>): go.Int32;
    @:native("ScanSpanPackedGo") static function scanSpanPackedGo(mem: go.unsafe.Pointer, bufp: go.Pointer<go.UIntPtr>, objMarks: go.Pointer<go.internal.runtime.gc.ObjMask>, sizeClass: go.UIntPtr, ptrMask: go.Pointer<go.internal.runtime.gc.PtrMask>): go.Int32;
    @:native("ScanSpanPackedReference") static function scanSpanPackedReference(mem: go.unsafe.Pointer, bufp: go.Pointer<go.UIntPtr>, objMarks: go.Pointer<go.internal.runtime.gc.ObjMask>, sizeClass: go.UIntPtr, ptrMask: go.Pointer<go.internal.runtime.gc.PtrMask>): go.Int32;

}