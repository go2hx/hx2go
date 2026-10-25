package go.syscall;

@:structInit
@:go.Type({ name: "Timezoneinformation", instanceName: "syscall.Timezoneinformation", imports: ["syscall"] })
extern class Timezoneinformation {

    @:native("Bias") var bias: go.Int32;
    @:native("StandardName") var standardName: go.GoArray<go.UInt16, 32>;
    @:native("StandardDate") var standardDate: go.syscall.Systemtime;
    @:native("StandardBias") var standardBias: go.Int32;
    @:native("DaylightName") var daylightName: go.GoArray<go.UInt16, 32>;
    @:native("DaylightDate") var daylightDate: go.syscall.Systemtime;
    @:native("DaylightBias") var daylightBias: go.Int32;

    function new(bias: go.Int32=0, standardName: go.GoArray<go.UInt16, 32>, standardDate: go.syscall.Systemtime, standardBias: go.Int32=0, daylightName: go.GoArray<go.UInt16, 32>, daylightDate: go.syscall.Systemtime, daylightBias: go.Int32=0);

}