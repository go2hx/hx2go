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
    
    public var options: ContextOptions ;
    
    private var _parser: IParser = new parser.dump.Dump();
    private var _cache: Map<String, Module> = [];

    /**
     * Gets the module cached inside the context.
     * @param path The path of the module (e.g. package.ClassName)
     * @return A module or null if not found.
     */
    public function getModule(path: String): Null<Module> {
        return _cache[path];
    }

    
    public function run(): ContextResults {
        final info = _parser.run("");
        for (module in info.modules) {
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