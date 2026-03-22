package;

import sys.FileSystem;
import sys.io.File;
import parser.IParser;
import haxe.io.Path;
import translator.TranslatorTools;

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

    @:opt_name("format")
    @:opt_desc("Format the output code after compilation")
    @:opt_type("Bool")
    public var formatAfterCompilation: Bool = false;


    @:opt_name("install_deps")
    @:opt_desc("Let hx2go install dependencies for you.")
    @:opt_type("Bool")
    public var installDependencies: Bool = false;

    @:opt_name("main")
    @:opt_desc("The entry point of your Haxe program.")
    @:opt_type("String")
    public var entryPoint: String = "Main";

    @:opt_name("output")
    @:opt_desc("Output location of the Go code")
    @:opt_type("String")
    public var output: String = "export";

    @:opt_name("tinygo")
    @:opt_desc("If set, tinygo will be used instead of the default go compiler")
    @:opt_type("Bool")
    public var tinygo: Bool = false;

    @:opt_name("tinygo.target")
    @:opt_desc("The target that tinygo should use")
    @:opt_type("String")
    public var tinygoTarget: String = "arduino";

    @:opt_name("tinygo.port")
    @:opt_desc("The port to flash the build to")
    @:opt_type("String")
    public var tinygoPort: String = "/dev/ttyUSB0";
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

    static final NATIVE_TINYGO_TARGETS = ["wasm", "wasi"];

    public var options: ContextOptions;
    
    private var _parser: IParser = null;
    private var _pathToModule:Map<String,String> = [];
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
        final modulePath = _pathToModule[path];
        if (modulePath == null) {
            return null;
        }
        return _cache[modulePath];
    }

    /**
     * Get the cache
     * @return the cache of modules
     */
    public inline function getCache(): Map<String, Module> {
        return _cache;
    }

    public inline function getPathToModule():Map<String, String>
        return _pathToModule;

    /**
     * Runs the hx2go transpiler.
     * @return A virtual filesystem of all the results including path, content and module.
     */
    public function run(): ContextResults {
        // adds def
        // sets context cache
        _parser.run("");

        for (module in _cache.iterator()) {
            if (module.path == options.entryPoint) {
                module.mainBool = true;
            }

            module.run();
        }

        if (!Logging.finalise()) {
            return null;
        }

        var compileList = [];
        var lastLength = -1;

        while (true) {
            for (mod in _cache.iterator()) {
                var usages = 0;

                for (def in mod.defs) {
                    for (origin in def.usages.keys()) {
                        if (origin == mod.path || !compileList.contains(origin)) continue;
                        usages += def.usages[origin];
                    }

                    for (m in def.meta()) {
                        if (m.name == ":keep") usages++;
                    }
                }

                if ((usages > 0 || mod.mainBool) && !compileList.contains(mod.path)) {
                    compileList.push(mod.path);
                }
            }

            if (compileList.length == lastLength) break;
            lastLength = compileList.length;
        }

        var imports = [];
        for (mod in _cache.iterator()) {
            mod.buf = new StringBuf();

            mod.buf.add("package main\n\n");

            if (!compileList.contains(mod.path)) continue;
            for (imp in mod.goImports) {
                if (!imports.contains(imp)) {
                    imports.push(imp);
                }
                mod.buf.add('import "' + imp + '"\n');
            }
        }


        if (!FileSystem.exists(options.output)) {
            FileSystem.createDirectory(options.output);
        }

        var entryPointPath = options.entryPoint;
        for (obj in _cache.keyValueIterator()) {
            final mod = obj.value;
            if (!compileList.contains(mod.path)) continue;
            if (mod.path == options.entryPoint) {
                for (def in mod.defs) {
                    for (field in def.fields) {
                        if (field.name == "main") {
                            entryPointPath = def.name;
                            break;
                        }
                    }
                }
            }

            for (def in mod.defs) {
                if (def.isExtern) 
                    continue;
                mod.buf.add(def.buf.toString());
            }
            if (mod.defs.length != 0 && !(mod.defs.length == 1 && mod.defs[0].isExtern)) {
                final file = mod.getFile();
                final outPath = Path.join([ options.output, file.path + ".go"]);
                File.saveContent(outPath, file.content);
            }
        }

        File.saveContent(Path.join([options.output, "hx_boot.go"]), createMain(entryPointPath));

        final cwd = Sys.getCwd();
        
        Sys.setCwd(options.output);

        if (!FileSystem.exists("go.mod")) {
            Sys.command("go mod init hx2go");
        }

        if (options.installDependencies) {
            for (imp in imports) {
                if (StringTools.contains(imp, ".")) Sys.command('go get $imp');
            }
        }

        if (options.formatAfterCompilation) {
            final code = Sys.command("goimports -w .");
            if (code != 0) {
                Sys.println("goimports failed make sure to install it:");
                Sys.println("\tgo install golang.org/x/tools/cmd/goimports@latest");
            }
            Sys.command("go fmt ./...");
        }

        if (options.tinygo) {
            // tinygo flash -target=... -port ...
            var action = "";

            if (options.buildAfterCompilation) {
                action = "build";
            }

            if (options.runAfterCompilation) {
                action = "flash";
            }

            if (action != "") {
                var cmd = 'tinygo $action';

                switch options.tinygoTarget {
                    case "wasi": {
                        cmd = 'GOOS=wasip1 GOARCH=wasm tinygo build -o output.wasm';
                        if (options.runAfterCompilation) cmd += ' && wasmtime ./output.wasm';
                    }

                    case "wasm": {
                        cmd = 'GOOS=js GOARCH=wasm tinygo build -o output.wasm';
                    }

                    case _: cmd += ' -target=${options.tinygoTarget}';
                }
                if (options.tinygoPort != null && options.tinygoPort != "") {
                    cmd += ' -port ${options.tinygoPort}';
                }

                Sys.command(cmd);
            }

        } else {
            if (options.buildAfterCompilation) {
                final code = Sys.command('go build .');
                if (code != 0)
                    Sys.exit(code);
            }

            if (options.runAfterCompilation) {
                final code = Sys.command('go run .');
                if (code != 0)
                    Sys.exit(code);
            }
        }

        Sys.setCwd(cwd);
        // TODO add in context results
        return [];
    }

    function createMain(entryPointPath:String):String {
        final buf = new StringBuf();
        buf.add('package main\n\n');
        buf.add('func Hx_Boot() {\n');
        buf.add('\tHx_${modulePathToPrefix(entryPointPath)}_Main_Field()\n');
        buf.add('}\n\n');

        buf.add('func main() {\n');
        buf.add('\tHx_Boot()\n');
        buf.add('}\n');

        return buf.toString();
    }

}

final outMap:Map<String,Bool> = [];