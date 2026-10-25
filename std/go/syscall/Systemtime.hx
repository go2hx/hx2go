package go.syscall;

@:structInit
@:go.Type({ name: "Systemtime", instanceName: "syscall.Systemtime", imports: ["syscall"] })
extern class Systemtime {

    @:native("Year") var year: go.UInt16;
    @:native("Month") var month: go.UInt16;
    @:native("DayOfWeek") var dayOfWeek: go.UInt16;
    @:native("Day") var day: go.UInt16;
    @:native("Hour") var hour: go.UInt16;
    @:native("Minute") var minute: go.UInt16;
    @:native("Second") var second: go.UInt16;
    @:native("Milliseconds") var milliseconds: go.UInt16;

    function new(year: go.UInt16=0, month: go.UInt16=0, dayOfWeek: go.UInt16=0, day: go.UInt16=0, hour: go.UInt16=0, minute: go.UInt16=0, second: go.UInt16=0, milliseconds: go.UInt16=0);

}