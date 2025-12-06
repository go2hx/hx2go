package;

import sys.io.File;
import parser.IParser;

@:structInit
class ContextOptions {
    @:opt_name("run")
    @:opt_desc("Will run the executable after compilation.")
    @:opt_type("Bool")
    public var runAfterCompilation: Bool = false;

    @:opt_name("main")
    @:opt_desc("The entry point of your Haxe program.")
    @:opt_type("String")
    public var entryPoint: String = "Main";
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
        _parser.run("");

        for (module in _cache.iterator()) {
            if (module.path == options.entryPoint)
                module.mainBool = true;
            module.run();
        }

        if (options.runAfterCompilation) {
            // Sys.command("go mod init hx2go");
            Sys.command("go run ./export/");
        }

        return null;
    }

}