package go.log;

/**
    Package slog provides structured logging,
    in which log records include a message,
    a severity level, and various other attributes
    expressed as key-value pairs.
    
    It defines a type, [Logger],
    which provides several methods (such as [Logger.Info] and [Logger.Error])
    for reporting events of interest.
    
    Each Logger is associated with a [Handler].
    A Logger output method creates a [Record] from the method arguments
    and passes it to the Handler, which decides how to handle it.
    There is a default Logger accessible through top-level functions
    (such as [Info] and [Error]) that call the corresponding Logger methods.
    
    A log record consists of a time, a level, a message, and a set of key-value
    pairs, where the keys are strings and the values may be of any type.
    As an example,
    
    	slog.Info("hello", "count", 3)
    
    creates a record containing the time of the call,
    a level of Info, the message "hello", and a single
    pair with key "count" and value 3.
    
    The [Info] top-level function calls the [Logger.Info] method on the default Logger.
    In addition to [Logger.Info], there are methods for Debug, Warn and Error levels.
    Besides these convenience methods for common levels,
    there is also a [Logger.Log] method which takes the level as an argument.
    Each of these methods has a corresponding top-level function that uses the
    default logger.
    
    The default handler formats the log record's message, time, level, and attributes
    as a string and passes it to the [log] package.
    
    	2022/11/08 15:28:26 INFO hello count=3
    
    For more control over the output format, create a logger with a different handler.
    This statement uses [New] to create a new logger with a [TextHandler]
    that writes structured records in text form to standard error:
    
    	logger := slog.New(slog.NewTextHandler(os.Stderr, nil))
    
    [TextHandler] output is a sequence of key=value pairs, easily and unambiguously
    parsed by machine. This statement:
    
    	logger.Info("hello", "count", 3)
    
    produces this output:
    
    	time=2022-11-08T15:28:26.000-05:00 level=INFO msg=hello count=3
    
    The package also provides [JSONHandler], whose output is line-delimited JSON:
    
    	logger := slog.New(slog.NewJSONHandler(os.Stdout, nil))
    	logger.Info("hello", "count", 3)
    
    produces this output:
    
    	{"time":"2022-11-08T15:28:26.000000000-05:00","level":"INFO","msg":"hello","count":3}
    
    Both [TextHandler] and [JSONHandler] can be configured with [HandlerOptions].
    There are options for setting the minimum level (see Levels, below),
    displaying the source file and line of the log call, and
    modifying attributes before they are logged.
    
    Setting a logger as the default with
    
    	slog.SetDefault(logger)
    
    will cause the top-level functions like [Info] to use it.
    [SetDefault] also updates the default logger used by the [log] package,
    so that existing applications that use [log.Printf] and related functions
    will send log records to the logger's handler without needing to be rewritten.
    
    Some attributes are common to many log calls.
    For example, you may wish to include the URL or trace identifier of a server request
    with all log events arising from the request.
    Rather than repeat the attribute with every log call, you can use [Logger.With]
    to construct a new Logger containing the attributes:
    
    	logger2 := logger.With("url", r.URL)
    
    The arguments to With are the same key-value pairs used in [Logger.Info].
    The result is a new Logger with the same handler as the original, but additional
    attributes that will appear in the output of every call.
    
    # Levels
    
    A [Level] is an integer representing the importance or severity of a log event.
    The higher the level, the more severe the event.
    This package defines constants for the most common levels,
    but any int can be used as a level.
    
    In an application, you may wish to log messages only at a certain level or greater.
    One common configuration is to log messages at Info or higher levels,
    suppressing debug logging until it is needed.
    The built-in handlers can be configured with the minimum level to output by
    setting [HandlerOptions.Level].
    The program's `main` function typically does this.
    The default value is LevelInfo.
    
    Setting the [HandlerOptions.Level] field to a [Level] value
    fixes the handler's minimum level throughout its lifetime.
    Setting it to a [LevelVar] allows the level to be varied dynamically.
    A LevelVar holds a Level and is safe to read or write from multiple
    goroutines.
    To vary the level dynamically for an entire program, first initialize
    a global LevelVar:
    
    	var programLevel = new(slog.LevelVar) // Info by default
    
    Then use the LevelVar to construct a handler, and make it the default:
    
    	h := slog.NewJSONHandler(os.Stderr, &slog.HandlerOptions{Level: programLevel})
    	slog.SetDefault(slog.New(h))
    
    Now the program can change its logging level with a single statement:
    
    	programLevel.Set(slog.LevelDebug)
    
    # Groups
    
    Attributes can be collected into groups.
    A group has a name that is used to qualify the names of its attributes.
    How this qualification is displayed depends on the handler.
    [TextHandler] separates the group and attribute names with a dot.
    [JSONHandler] treats each group as a separate JSON object, with the group name as the key.
    
    Use [Group] to create a Group attribute from a name and a list of key-value pairs:
    
    	slog.Group("request",
    	    "method", r.Method,
    	    "url", r.URL)
    
    TextHandler would display this group as
    
    	request.method=GET request.url=http://example.com
    
    JSONHandler would display it as
    
    	"request":{"method":"GET","url":"http://example.com"}
    
    Use [Logger.WithGroup] to qualify all of a Logger's output
    with a group name. Calling WithGroup on a Logger results in a
    new Logger with the same Handler as the original, but with all
    its attributes qualified by the group name.
    
    This can help prevent duplicate attribute keys in large systems,
    where subsystems might use the same keys.
    Pass each subsystem a different Logger with its own group name so that
    potential duplicates are qualified:
    
    	logger := slog.Default().With("id", systemID)
    	parserLogger := logger.WithGroup("parser")
    	parseInput(input, parserLogger)
    
    When parseInput logs with parserLogger, its keys will be qualified with "parser",
    so even if it uses the common key "id", the log line will have distinct keys.
    
    # Contexts
    
    Some handlers may wish to include information from the [context.Context] that is
    available at the call site. One example of such information
    is the identifier for the current span when tracing is enabled.
    
    The [Logger.Log] and [Logger.LogAttrs] methods take a context as a first
    argument, as do their corresponding top-level functions.
    
    Although the convenience methods on Logger (Info and so on) and the
    corresponding top-level functions do not take a context, the alternatives ending
    in "Context" do. For example,
    
    	slog.InfoContext(ctx, "message")
    
    It is recommended to pass a context to an output method if one is available.
    
    # Attrs and Values
    
    An [Attr] is a key-value pair. The Logger output methods accept Attrs as well as
    alternating keys and values. The statement
    
    	slog.Info("hello", slog.Int("count", 3))
    
    behaves the same as
    
    	slog.Info("hello", "count", 3)
    
    There are convenience constructors for [Attr] such as [Int], [String], and [Bool]
    for common types, as well as the function [Any] for constructing Attrs of any
    type.
    
    The value part of an Attr is a type called [Value].
    Like an [any], a Value can hold any Go value,
    but it can represent typical values, including all numbers and strings,
    without an allocation.
    
    For the most efficient log output, use [Logger.LogAttrs].
    It is similar to [Logger.Log] but accepts only Attrs, not alternating
    keys and values; this allows it, too, to avoid allocation.
    
    The call
    
    	logger.LogAttrs(ctx, slog.LevelInfo, "hello", slog.Int("count", 3))
    
    is the most efficient way to achieve the same output as
    
    	slog.InfoContext(ctx, "hello", "count", 3)
    
    # Customizing a type's logging behavior
    
    If a type implements the [LogValuer] interface, the [Value] returned from its LogValue
    method is used for logging. You can use this to control how values of the type
    appear in logs. For example, you can redact secret information like passwords,
    or gather a struct's fields in a Group. See the examples under [LogValuer] for
    details.
    
    A LogValue method may return a Value that itself implements [LogValuer]. The [Value.Resolve]
    method handles these cases carefully, avoiding infinite loops and unbounded recursion.
    Handler authors and others may wish to use [Value.Resolve] instead of calling LogValue directly.
    
    # Wrapping output methods
    
    The logger functions use reflection over the call stack to find the file name
    and line number of the logging call within the application. This can produce
    incorrect source information for functions that wrap slog. For instance, if you
    define this function in file mylog.go:
    
    	func Infof(logger *slog.Logger, format string, args ...any) {
    	    logger.Info(fmt.Sprintf(format, args...))
    	}
    
    and you call it like this in main.go:
    
    	Infof(slog.Default(), "hello, %s", "world")
    
    then slog will report the source file as mylog.go, not main.go.
    
    A correct implementation of Infof will obtain the source location
    (pc) and pass it to NewRecord.
    The Infof function in the package-level example called "wrapping"
    demonstrates how to do this.
    
    # Working with Records
    
    Sometimes a Handler will need to modify a Record
    before passing it on to another Handler or backend.
    A Record contains a mixture of simple public fields (e.g. Time, Level, Message)
    and hidden fields that refer to state (such as attributes) indirectly. This
    means that modifying a simple copy of a Record (e.g. by calling
    [Record.Add] or [Record.AddAttrs] to add attributes)
    may have unexpected effects on the original.
    Before modifying a Record, use [Record.Clone] to
    create a copy that shares no state with the original,
    or create a new Record with [NewRecord]
    and build up its Attrs by traversing the old ones with [Record.Attrs].
    
    # Performance considerations
    
    If profiling your application demonstrates that logging is taking significant time,
    the following suggestions may help.
    
    If many log lines have a common attribute, use [Logger.With] to create a Logger with
    that attribute. The built-in handlers will format that attribute only once, at the
    call to [Logger.With]. The [Handler] interface is designed to allow that optimization,
    and a well-written Handler should take advantage of it.
    
    The arguments to a log call are always evaluated, even if the log event is discarded.
    If possible, defer computation so that it happens only if the value is actually logged.
    For example, consider the call
    
    	slog.Info("starting request", "url", r.URL.String())  // may compute String unnecessarily
    
    The URL.String method will be called even if the logger discards Info-level events.
    Instead, pass the URL directly:
    
    	slog.Info("starting request", "url", &r.URL) // calls URL.String only if needed
    
    The built-in [TextHandler] will call its String method, but only
    if the log event is enabled.
    Avoiding the call to String also preserves the structure of the underlying value.
    For example [JSONHandler] emits the components of the parsed URL as a JSON object.
    If you want to avoid eagerly paying the cost of the String call
    without causing the handler to potentially inspect the structure of the value,
    wrap the value in a fmt.Stringer implementation that hides its Marshal methods.
    
    You can also use the [LogValuer] interface to avoid unnecessary work in disabled log
    calls. Say you need to log some expensive value:
    
    	slog.Debug("frobbing", "value", computeExpensiveValue(arg))
    
    Even if this line is disabled, computeExpensiveValue will be called.
    To avoid that, define a type implementing LogValuer:
    
    	type expensive struct { arg int }
    
    	func (e expensive) LogValue() slog.Value {
    	    return slog.AnyValue(computeExpensiveValue(e.arg))
    	}
    
    Then use a value of that type in log calls:
    
    	slog.Debug("frobbing", "value", expensive{arg})
    
    Now computeExpensiveValue will only be called when the line is enabled.
    
    The built-in handlers acquire a lock before calling [io.Writer.Write]
    to ensure that exactly one [Record] is written at a time in its entirety.
    Although each log record has a timestamp,
    the built-in handlers do not use that time to sort the written records.
    User-defined handlers are responsible for their own locking and sorting.
    
    # Writing a handler
    
    For a guide to writing a custom handler, see https://golang.org/s/slog-handler-guide.
**/
@:go.Type({ name: "slog", instanceName: "slog.slog", imports: ["log/slog"] })
extern class Slog {

    @:native("KindAny") static var kindAny: go.log.slog.Kind;
    @:native("KindBool") static var kindBool: go.log.slog.Kind;
    @:native("KindDuration") static var kindDuration: go.log.slog.Kind;
    @:native("KindFloat64") static var kindFloat64: go.log.slog.Kind;
    @:native("KindGroup") static var kindGroup: go.log.slog.Kind;
    @:native("KindInt64") static var kindInt64: go.log.slog.Kind;
    @:native("KindLogValuer") static var kindLogValuer: go.log.slog.Kind;
    @:native("KindString") static var kindString: go.log.slog.Kind;
    @:native("KindTime") static var kindTime: go.log.slog.Kind;
    @:native("KindUint64") static var kindUint64: go.log.slog.Kind;
    /**
        Names for common levels.
        
        Level numbers are inherently arbitrary,
        but we picked them to satisfy three constraints.
        Any system can map them to another numbering scheme if it wishes.
        
        First, we wanted the default level to be Info, Since Levels are ints, Info is
        the default value for int, zero.
        
        Second, we wanted to make it easy to use levels to specify logger verbosity.
        Since a larger level means a more severe event, a logger that accepts events
        with smaller (or more negative) level means a more verbose logger. Logger
        verbosity is thus the negation of event severity, and the default verbosity
        of 0 accepts all events at least as severe as INFO.
        
        Third, we wanted some room between levels to accommodate schemes with named
        levels between ours. For example, Google Cloud Logging defines a Notice level
        between Info and Warn. Since there are only a few of these intermediate
        levels, the gap between the numbers need not be large. Our gap of 4 matches
        OpenTelemetry's mapping. Subtracting 9 from an OpenTelemetry level in the
        DEBUG, INFO, WARN and ERROR ranges converts it to the corresponding slog
        Level range. OpenTelemetry also has the names TRACE and FATAL, which slog
        does not. But those OpenTelemetry levels can still be represented as slog
        Levels by using the appropriate integers.
    **/
    @:native("LevelDebug") static var levelDebug: go.log.slog.Level;
    /**
        Names for common levels.
        
        Level numbers are inherently arbitrary,
        but we picked them to satisfy three constraints.
        Any system can map them to another numbering scheme if it wishes.
        
        First, we wanted the default level to be Info, Since Levels are ints, Info is
        the default value for int, zero.
        
        Second, we wanted to make it easy to use levels to specify logger verbosity.
        Since a larger level means a more severe event, a logger that accepts events
        with smaller (or more negative) level means a more verbose logger. Logger
        verbosity is thus the negation of event severity, and the default verbosity
        of 0 accepts all events at least as severe as INFO.
        
        Third, we wanted some room between levels to accommodate schemes with named
        levels between ours. For example, Google Cloud Logging defines a Notice level
        between Info and Warn. Since there are only a few of these intermediate
        levels, the gap between the numbers need not be large. Our gap of 4 matches
        OpenTelemetry's mapping. Subtracting 9 from an OpenTelemetry level in the
        DEBUG, INFO, WARN and ERROR ranges converts it to the corresponding slog
        Level range. OpenTelemetry also has the names TRACE and FATAL, which slog
        does not. But those OpenTelemetry levels can still be represented as slog
        Levels by using the appropriate integers.
    **/
    @:native("LevelError") static var levelError: go.log.slog.Level;
    /**
        Names for common levels.
        
        Level numbers are inherently arbitrary,
        but we picked them to satisfy three constraints.
        Any system can map them to another numbering scheme if it wishes.
        
        First, we wanted the default level to be Info, Since Levels are ints, Info is
        the default value for int, zero.
        
        Second, we wanted to make it easy to use levels to specify logger verbosity.
        Since a larger level means a more severe event, a logger that accepts events
        with smaller (or more negative) level means a more verbose logger. Logger
        verbosity is thus the negation of event severity, and the default verbosity
        of 0 accepts all events at least as severe as INFO.
        
        Third, we wanted some room between levels to accommodate schemes with named
        levels between ours. For example, Google Cloud Logging defines a Notice level
        between Info and Warn. Since there are only a few of these intermediate
        levels, the gap between the numbers need not be large. Our gap of 4 matches
        OpenTelemetry's mapping. Subtracting 9 from an OpenTelemetry level in the
        DEBUG, INFO, WARN and ERROR ranges converts it to the corresponding slog
        Level range. OpenTelemetry also has the names TRACE and FATAL, which slog
        does not. But those OpenTelemetry levels can still be represented as slog
        Levels by using the appropriate integers.
    **/
    @:native("LevelInfo") static var levelInfo: go.log.slog.Level;
    /**
        Keys for "built-in" attributes.
    **/
    @:native("LevelKey") static var levelKey: std.String;
    /**
        Names for common levels.
        
        Level numbers are inherently arbitrary,
        but we picked them to satisfy three constraints.
        Any system can map them to another numbering scheme if it wishes.
        
        First, we wanted the default level to be Info, Since Levels are ints, Info is
        the default value for int, zero.
        
        Second, we wanted to make it easy to use levels to specify logger verbosity.
        Since a larger level means a more severe event, a logger that accepts events
        with smaller (or more negative) level means a more verbose logger. Logger
        verbosity is thus the negation of event severity, and the default verbosity
        of 0 accepts all events at least as severe as INFO.
        
        Third, we wanted some room between levels to accommodate schemes with named
        levels between ours. For example, Google Cloud Logging defines a Notice level
        between Info and Warn. Since there are only a few of these intermediate
        levels, the gap between the numbers need not be large. Our gap of 4 matches
        OpenTelemetry's mapping. Subtracting 9 from an OpenTelemetry level in the
        DEBUG, INFO, WARN and ERROR ranges converts it to the corresponding slog
        Level range. OpenTelemetry also has the names TRACE and FATAL, which slog
        does not. But those OpenTelemetry levels can still be represented as slog
        Levels by using the appropriate integers.
    **/
    @:native("LevelWarn") static var levelWarn: go.log.slog.Level;
    /**
        Keys for "built-in" attributes.
    **/
    @:native("MessageKey") static var messageKey: std.String;
    /**
        Keys for "built-in" attributes.
    **/
    @:native("SourceKey") static var sourceKey: std.String;
    /**
        Keys for "built-in" attributes.
    **/
    @:native("TimeKey") static var timeKey: std.String;

    /**
        DiscardHandler discards all log output.
        DiscardHandler.Enabled returns false for all Levels.
    **/
    @:native("DiscardHandler") static var discardHandler: go.log.slog.Handler;

    /**
        Any returns an Attr for the supplied value.
        See [AnyValue] for how values are treated.
    **/
    @:native("Any") static function any(key: std.String, value: Dynamic): (go.log.slog.Attr);
    /**
        AnyValue returns a [Value] for the supplied value.
        
        If the supplied value is of type Value, it is returned
        unmodified.
        
        Given a value of one of Go's predeclared string, bool, or
        (non-complex) numeric types, AnyValue returns a Value of kind
        [KindString], [KindBool], [KindUint64], [KindInt64], or [KindFloat64].
        The width of the original numeric type is not preserved.
        
        Given a [time.Time] or [time.Duration] value, AnyValue returns a Value of kind
        [KindTime] or [KindDuration]. The monotonic time is not preserved.
        
        For nil, or values of all other types, including named types whose
        underlying type is numeric, AnyValue returns a value of kind [KindAny].
    **/
    @:native("AnyValue") static function anyValue(v: Dynamic): (go.log.slog.Value);
    /**
        Bool returns an Attr for a bool.
    **/
    @:native("Bool") static function bool(key: std.String, v: Bool): (go.log.slog.Attr);
    /**
        BoolValue returns a [Value] for a bool.
    **/
    @:native("BoolValue") static function boolValue(v: Bool): (go.log.slog.Value);
    /**
        Debug calls [Logger.Debug] on the default logger.
    **/
    @:native("Debug") static function debug(msg: std.String, args: haxe.Rest<Dynamic>): Void;
    /**
        DebugContext calls [Logger.DebugContext] on the default logger.
    **/
    @:native("DebugContext") static function debugContext(ctx: go.context.Context, msg: std.String, args: haxe.Rest<Dynamic>): Void;
    /**
        Default returns the default [Logger].
    **/
    @:native("Default") static function _default(): (go.Pointer<go.log.slog.Logger>);
    /**
        Duration returns an Attr for a [time.Duration].
    **/
    @:native("Duration") static function duration(key: std.String, v: go.time.Duration): (go.log.slog.Attr);
    /**
        DurationValue returns a [Value] for a [time.Duration].
    **/
    @:native("DurationValue") static function durationValue(v: go.time.Duration): (go.log.slog.Value);
    /**
        Error calls [Logger.Error] on the default logger.
    **/
    @:native("Error") static function error(msg: std.String, args: haxe.Rest<Dynamic>): Void;
    /**
        ErrorContext calls [Logger.ErrorContext] on the default logger.
    **/
    @:native("ErrorContext") static function errorContext(ctx: go.context.Context, msg: std.String, args: haxe.Rest<Dynamic>): Void;
    /**
        Float64 returns an Attr for a floating-point number.
    **/
    @:native("Float64") static function float64(key: std.String, v: Float): (go.log.slog.Attr);
    /**
        Float64Value returns a [Value] for a floating-point number.
    **/
    @:native("Float64Value") static function float64Value(v: Float): (go.log.slog.Value);
    /**
        Group returns an Attr for a Group [Value].
        The first argument is the key; the remaining arguments
        are converted to Attrs as in [Logger.Log].
        
        Use Group to collect several key-value pairs under a single
        key on a log line, or as the result of LogValue
        in order to log a single value as multiple Attrs.
    **/
    @:native("Group") static function group(key: std.String, args: haxe.Rest<Dynamic>): (go.log.slog.Attr);
    /**
        GroupAttrs returns an Attr for a Group [Value]
        consisting of the given Attrs.
        
        GroupAttrs is a more efficient version of [Group]
        that accepts only [Attr] values.
    **/
    @:native("GroupAttrs") static function groupAttrs(key: std.String, attrs: haxe.Rest<go.log.slog.Attr>): (go.log.slog.Attr);
    /**
        GroupValue returns a new [Value] for a list of Attrs.
        The caller must not subsequently mutate the argument slice.
    **/
    @:native("GroupValue") static function groupValue(as: haxe.Rest<go.log.slog.Attr>): (go.log.slog.Value);
    /**
        Info calls [Logger.Info] on the default logger.
    **/
    @:native("Info") static function info(msg: std.String, args: haxe.Rest<Dynamic>): Void;
    /**
        InfoContext calls [Logger.InfoContext] on the default logger.
    **/
    @:native("InfoContext") static function infoContext(ctx: go.context.Context, msg: std.String, args: haxe.Rest<Dynamic>): Void;
    /**
        Int converts an int to an int64 and returns
        an Attr with that value.
    **/
    @:native("Int") static function int(key: std.String, value: go.GoInt): (go.log.slog.Attr);
    /**
        Int64 returns an Attr for an int64.
    **/
    @:native("Int64") static function int64(key: std.String, value: go.Int64): (go.log.slog.Attr);
    /**
        Int64Value returns a [Value] for an int64.
    **/
    @:native("Int64Value") static function int64Value(v: go.Int64): (go.log.slog.Value);
    /**
        IntValue returns a [Value] for an int.
    **/
    @:native("IntValue") static function intValue(v: go.GoInt): (go.log.slog.Value);
    /**
        Log calls [Logger.Log] on the default logger.
    **/
    @:native("Log") static function log(ctx: go.context.Context, level: go.log.slog.Level, msg: std.String, args: haxe.Rest<Dynamic>): Void;
    /**
        LogAttrs calls [Logger.LogAttrs] on the default logger.
    **/
    @:native("LogAttrs") static function logAttrs(ctx: go.context.Context, level: go.log.slog.Level, msg: std.String, attrs: haxe.Rest<go.log.slog.Attr>): Void;
    /**
        New creates a new Logger with the given non-nil Handler.
    **/
    @:native("New") static function _new(h: go.log.slog.Handler): (go.Pointer<go.log.slog.Logger>);
    /**
        NewJSONHandler creates a [JSONHandler] that writes to w,
        using the given options.
        If opts is nil, the default options are used.
    **/
    @:native("NewJSONHandler") static function newJSONHandler(w: go.io.Writer, opts: go.Pointer<go.log.slog.HandlerOptions>): (go.Pointer<go.log.slog.JSONHandler>);
    /**
        NewLogLogger returns a new [log.Logger] such that each call to its Output method
        dispatches a Record to the specified handler. The logger acts as a bridge from
        the older log API to newer structured logging handlers.
    **/
    @:native("NewLogLogger") static function newLogLogger(h: go.log.slog.Handler, level: go.log.slog.Level): (go.Pointer<go.log.Logger>);
    /**
        NewMultiHandler creates a [MultiHandler] with the given Handlers.
    **/
    @:native("NewMultiHandler") static function newMultiHandler(handlers: haxe.Rest<go.log.slog.Handler>): (go.Pointer<go.log.slog.MultiHandler>);
    /**
        NewRecord creates a [Record] from the given arguments.
        Use [Record.AddAttrs] to add attributes to the Record.
        
        NewRecord is intended for logging APIs that want to support a [Handler] as
        a backend.
    **/
    @:native("NewRecord") static function newRecord(t: go.time.Time, level: go.log.slog.Level, msg: std.String, pc: go.UIntPtr): (go.log.slog.Record);
    /**
        NewTextHandler creates a [TextHandler] that writes to w,
        using the given options.
        If opts is nil, the default options are used.
    **/
    @:native("NewTextHandler") static function newTextHandler(w: go.io.Writer, opts: go.Pointer<go.log.slog.HandlerOptions>): (go.Pointer<go.log.slog.TextHandler>);
    /**
        SetDefault makes l the default [Logger], which is used by
        the top-level functions [Info], [Debug] and so on.
        After this call, output from the log package's default Logger
        (as with [log.Print], etc.) will be logged using l's Handler,
        at a level controlled by [SetLogLoggerLevel].
    **/
    @:native("SetDefault") static function setDefault(l: go.Pointer<go.log.slog.Logger>): Void;
    /**
        SetLogLoggerLevel controls the level for the bridge to the [log] package.
        
        Before [SetDefault] is called, slog top-level logging functions call the default [log.Logger].
        In that mode, SetLogLoggerLevel sets the minimum level for those calls.
        By default, the minimum level is Info, so calls to [Debug]
        (as well as top-level logging calls at lower levels)
        will not be passed to the log.Logger. After calling
        
        	slog.SetLogLoggerLevel(slog.LevelDebug)
        
        calls to [Debug] will be passed to the log.Logger.
        
        After [SetDefault] is called, calls to the default [log.Logger] are passed to the
        slog default handler. In that mode,
        SetLogLoggerLevel sets the level at which those calls are logged.
        That is, after calling
        
        	slog.SetLogLoggerLevel(slog.LevelDebug)
        
        A call to [log.Printf] will result in output at level [LevelDebug].
        
        SetLogLoggerLevel returns the previous value.
    **/
    @:native("SetLogLoggerLevel") static function setLogLoggerLevel(level: go.log.slog.Level): (go.log.slog.Level);
    /**
        String returns an Attr for a string value.
    **/
    @:native("String") static function string(key: std.String, value: std.String): (go.log.slog.Attr);
    /**
        StringValue returns a new [Value] for a string.
    **/
    @:native("StringValue") static function stringValue(value: std.String): (go.log.slog.Value);
    /**
        Time returns an Attr for a [time.Time].
        It discards the monotonic portion.
    **/
    @:native("Time") static function time(key: std.String, v: go.time.Time): (go.log.slog.Attr);
    /**
        TimeValue returns a [Value] for a [time.Time].
        It discards the monotonic portion.
    **/
    @:native("TimeValue") static function timeValue(v: go.time.Time): (go.log.slog.Value);
    /**
        Uint64 returns an Attr for a uint64.
    **/
    @:native("Uint64") static function uint64(key: std.String, v: go.UInt64): (go.log.slog.Attr);
    /**
        Uint64Value returns a [Value] for a uint64.
    **/
    @:native("Uint64Value") static function uint64Value(v: go.UInt64): (go.log.slog.Value);
    /**
        Warn calls [Logger.Warn] on the default logger.
    **/
    @:native("Warn") static function warn(msg: std.String, args: haxe.Rest<Dynamic>): Void;
    /**
        WarnContext calls [Logger.WarnContext] on the default logger.
    **/
    @:native("WarnContext") static function warnContext(ctx: go.context.Context, msg: std.String, args: haxe.Rest<Dynamic>): Void;
    /**
        With calls [Logger.With] on the default logger.
    **/
    @:native("With") static function with(args: haxe.Rest<Dynamic>): (go.Pointer<go.log.slog.Logger>);

}