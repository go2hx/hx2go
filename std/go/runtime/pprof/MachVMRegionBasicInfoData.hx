package go.runtime.pprof;

@:structInit
@:go.Type({ name: "machVMRegionBasicInfoData", instanceName: "pprof.machVMRegionBasicInfoData", imports: ["runtime/pprof"] })
extern class MachVMRegionBasicInfoData {

    @:native("Protection") var protection: go.Int32;
    @:native("Max_protection") var max_protection: go.Int32;
    @:native("Inheritance") var inheritance: go.UInt32;
    @:native("Shared") var shared: go.UInt32;
    @:native("Reserved") var reserved: go.UInt32;
    @:native("Offset") var offset: go.GoArray<go.Byte, 8>;
    @:native("Behavior") var behavior: go.Int32;
    @:native("User_wired_count") var user_wired_count: go.UInt16;
    @:native("Pad_cgo_1") var pad_cgo_1: go.GoArray<go.Byte, 2>;

    function new(protection: go.Int32=0, max_protection: go.Int32=0, inheritance: go.UInt32=0, shared: go.UInt32=0, reserved: go.UInt32=0, offset: go.GoArray<go.Byte, 8>, behavior: go.Int32=0, user_wired_count: go.UInt16=0, pad_cgo_1: go.GoArray<go.Byte, 2>);

}