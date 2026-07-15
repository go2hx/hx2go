package go.internal.abi;

@:structInit
@:go.Type({ name: "RegArgs", instanceName: "abi.RegArgs", imports: ["internal/abi"] })
extern class RegArgs {

    @:native("Ints") var ints: go.GoArray<go.UIntPtr, 9>;
    @:native("Floats") var floats: go.GoArray<go.UInt64, 15>;
    @:native("Ptrs") var ptrs: go.GoArray<go.unsafe.Pointer, 9>;
    @:native("ReturnIsPtr") var returnIsPtr: go.internal.abi.IntArgRegBitmap;

function new(ints: go.GoArray<go.UIntPtr, 9>, floats: go.GoArray<go.UInt64, 15>, ptrs: go.GoArray<go.unsafe.Pointer, 9>, returnIsPtr: go.internal.abi.IntArgRegBitmap);

    @:native("Dump") function dump(): Void;
    @:native("IntRegArgAddr") function intRegArgAddr(reg: go.GoInt, argSize: go.UIntPtr): go.unsafe.Pointer;

}