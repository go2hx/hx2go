package go.log;

/**
    A Logger represents an active logging object that generates lines of
    output to an [io.Writer]. Each logging operation makes a single call to
    the Writer's Write method. A Logger can be used simultaneously from
    multiple goroutines; it guarantees to serialize access to the Writer.
**/
@:structInit
@:go.Type({ name: "Logger", instanceName: "log.Logger", imports: ["log"] })
extern class Logger {

    /**
        Fatal is equivalent to l.Print() followed by a call to [os.Exit](1).
    **/
    @:native("Fatal") function fatal(v: haxe.Rest<Dynamic>): Void;
    /**
        Fatalf is equivalent to l.Printf() followed by a call to [os.Exit](1).
    **/
    @:native("Fatalf") function fatalf(format: String, v: haxe.Rest<Dynamic>): Void;
    /**
        Fatalln is equivalent to l.Println() followed by a call to [os.Exit](1).
    **/
    @:native("Fatalln") function fatalln(v: haxe.Rest<Dynamic>): Void;
    /**
        Flags returns the output flags for the logger.
        The flag bits are [Ldate], [Ltime], and so on.
    **/
    @:native("Flags") function flags(): (go.GoInt);
    /**
        Output writes the output for a logging event. The string s contains
        the text to print after the prefix specified by the flags of the
        Logger. A newline is appended if the last character of s is not
        already a newline. Calldepth is used to recover the PC and is
        provided for generality, although at the moment on all pre-defined
        paths it will be 2.
    **/
    @:native("Output") function output(calldepth: go.GoInt, s: String): (go.Error);
    /**
        Panic is equivalent to l.Print() followed by a call to panic().
    **/
    @:native("Panic") function panic(v: haxe.Rest<Dynamic>): Void;
    /**
        Panicf is equivalent to l.Printf() followed by a call to panic().
    **/
    @:native("Panicf") function panicf(format: String, v: haxe.Rest<Dynamic>): Void;
    /**
        Panicln is equivalent to l.Println() followed by a call to panic().
    **/
    @:native("Panicln") function panicln(v: haxe.Rest<Dynamic>): Void;
    /**
        Prefix returns the output prefix for the logger.
    **/
    @:native("Prefix") function prefix(): (String);
    /**
        Print calls l.Output to print to the logger.
        Arguments are handled in the manner of [fmt.Print].
    **/
    @:native("Print") function print(v: haxe.Rest<Dynamic>): Void;
    /**
        Printf calls l.Output to print to the logger.
        Arguments are handled in the manner of [fmt.Printf].
    **/
    @:native("Printf") function printf(format: String, v: haxe.Rest<Dynamic>): Void;
    /**
        Println calls l.Output to print to the logger.
        Arguments are handled in the manner of [fmt.Println].
    **/
    @:native("Println") function println(v: haxe.Rest<Dynamic>): Void;
    /**
        SetFlags sets the output flags for the logger.
        The flag bits are [Ldate], [Ltime], and so on.
    **/
    @:native("SetFlags") function setFlags(flag: go.GoInt): Void;
    /**
        SetOutput sets the output destination for the logger.
    **/
    @:native("SetOutput") function setOutput(w: go.io.Writer): Void;
    /**
        SetPrefix sets the output prefix for the logger.
    **/
    @:native("SetPrefix") function setPrefix(prefix: String): Void;
    /**
        Writer returns the output destination for the logger.
    **/
    @:native("Writer") function writer(): (go.io.Writer);

}