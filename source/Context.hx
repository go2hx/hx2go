package;

import sys.FileSystem;
import sys.io.File;
import parser.IParser;

@:structInit
class ContextOptions {
    @:opt_name("run")
    @:opt_desc("Run the executable after compilation.")
    @:opt_type("Bool")
    public var runAfterCompilation: Bool = false;

    @:opt_name("build")
    @:opt_desc("Build the executable after compilation.")
    @:opt_type("Bool")
    public var buildAfterCompilation: Bool = false;

    @:opt_name("main")
    @:opt_desc("The entry point of your Haxe program.")
    @:opt_type("String")
    public var entryPoint: String = "Main";
    @:opt_name("output")
    @:opt_desc("Output location of the Go code")
    @:opt_type("String")
    public var output: String = "export";
}

@:structInit
class ContextFile {
    public var path: String;
    public var content: String;
    public var module: Module;
}

typedef ContextResults = Array<ContextFile>;

@:structInit
class Context {
    
    public var options: ContextOptions;
    
    private var _parser: IParser = null;
    private var _cache: Map<String, Module> = [];

    public function new(options: ContextOptions) {
        this.options = options;
        this._parser = new parser.dump.Dump(this);
    }

    /**
     * Gets the module cached inside the context.
     * @param path The path of the module (e.g. package.ClassName)
     * @return A module or null if not found.
     */
    public function getModule(path: String): Null<Module> {
        return _cache[path];
    }

    /**
     * Get the cache
     * @return the cache of modules
     */
    public inline function getCache(): Map<String, Module> {
        return _cache;
    }

    /**
     * Runs the hx2go transpiler.
     * @return A virtual filesystem of all the results including path, content and module.
     */
    public function run(): ContextResults {
        // adds def
        // sets context cache
        _parser.run("");

        for (module in _cache.iterator()) {
            if (module.path == options.entryPoint)
                module.mainBool = true;
            module.run();
        }
        // get current location
        final cwd = Sys.getCwd();
        // go to output directory
        Sys.setCwd(options.output);
        // create go.mod
        if (!FileSystem.exists("go.mod"))
            Sys.command("go mod init hx2go");
        if (options.buildAfterCompilation) {
            haxe.Timer.measure(() -> Sys.command('go build .'));
        }
        if (options.runAfterCompilation) {
            Sys.command('go run .');
        }
        // revert back cwd
        Sys.setCwd(cwd);

        return null;
    }

}