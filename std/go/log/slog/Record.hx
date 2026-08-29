package go.log.slog;

/**
    A Record holds information about a log event.
    Copies of a Record share state.
    Do not modify a Record after handing out a copy to it.
    Call [NewRecord] to create a new Record.
    Use [Record.Clone] to create a copy with no shared state.
**/
@:structInit
@:go.Type({ name: "Record", instanceName: "slog.Record", imports: ["log/slog"] })
extern class Record {

    @:native("Time") var time: go.time.Time;
    @:native("Message") var message: std.String;
    @:native("Level") var level: go.log.slog.Level;
    @:native("PC") var PC: go.UIntPtr;

    function new(time: go.time.Time, message: std.String="", level: go.log.slog.Level=cast 0, PC: go.UIntPtr=0);

    /**
        Add converts the args to Attrs as described in [Logger.Log],
        then appends the Attrs to the [Record]'s list of Attrs.
        It omits empty groups.
    **/
    @:native("Add") function add(args: haxe.Rest<Dynamic>): Void;
    /**
        AddAttrs appends the given Attrs to the [Record]'s list of Attrs.
        It omits empty groups.
    **/
    @:native("AddAttrs") function addAttrs(attrs: haxe.Rest<go.log.slog.Attr>): Void;
    /**
        Attrs calls f on each Attr in the [Record].
        Iteration stops if f returns false.
    **/
    @:native("Attrs") function attrs(f: (p0: go.log.slog.Attr) -> (Bool)): Void;
    /**
        Clone returns a copy of the record with no shared state.
        The original record and the clone can both be modified
        without interfering with each other.
    **/
    @:native("Clone") function clone(): (go.log.slog.Record);
    /**
        NumAttrs returns the number of attributes in the [Record].
    **/
    @:native("NumAttrs") function numAttrs(): (go.GoInt);
    /**
        Source returns a new Source for the log event using r's PC.
        If the PC field is zero, meaning the Record was created without the necessary information
        or the location is unavailable, then nil is returned.
    **/
    @:native("Source") function source(): (go.Pointer<go.log.slog.Source>);

}