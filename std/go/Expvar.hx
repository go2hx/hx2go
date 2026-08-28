package go;

/**
    Package expvar provides a standardized interface to public variables, such
    as operation counters in servers. It exposes these variables via HTTP at
    /debug/vars in JSON format. As of Go 1.22, the /debug/vars request must
    use GET.
    
    Operations to set or modify these public variables are atomic.
    
    In addition to adding the HTTP handler, this package registers the
    following variables:
    
    	cmdline   os.Args
    	memstats  runtime.Memstats
    
    The package is sometimes only imported for the side effect of
    registering its HTTP handler and the above variables. To use it
    this way, link this package into your program:
    
    	import _ "expvar"
**/
@:go.Type({ name: "expvar", instanceName: "expvar.expvar", imports: ["expvar"] })
extern class Expvar {

    /**
        Do calls f for each exported variable.
        The global variable map is locked during the iteration,
        but existing entries may be concurrently updated.
    **/
    @:native("Do") static function _do(f: (p0: go.expvar.KeyValue) -> Void): Void;
    /**
        Get retrieves a named exported variable. It returns nil if the name has
        not been registered.
    **/
    @:native("Get") static function get(name: std.String): (go.expvar.Var);
    /**
        Handler returns the expvar HTTP Handler.
        
        This is only needed to install the handler in a non-standard location.
    **/
    @:native("Handler") static function handler(): (go.net.http.Handler);
    @:native("NewFloat") static function newFloat(name: std.String): (go.Pointer<go.expvar.Float>);
    @:native("NewInt") static function newInt(name: std.String): (go.Pointer<go.expvar.Int>);
    @:native("NewMap") static function newMap(name: std.String): (go.Pointer<go.expvar.Map>);
    @:native("NewString") static function newString(name: std.String): (go.Pointer<go.expvar.String>);
    /**
        Publish declares a named exported variable. This should be called from a
        package's init function when it creates its Vars. If the name is already
        registered then this will log.Panic.
    **/
    @:native("Publish") static function publish(name: std.String, v: go.expvar.Var): Void;

}