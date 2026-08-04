package go;

#if (macro)
import sys.io.File;
import hx2go.version.Version;
import sys.FileSystem;
import haxe.macro.PlatformConfig;
import haxe.macro.Compiler;
import haxe.macro.Context;
import haxe.Timer;
import haxe.io.Path;
import haxe.hxb.WriterConfig;
import sys.io.Process;

class Init {
	@:persistent static var builtLibs = [];
	// --macro go.Init.addStd()
	public static function addStd() {
		if (!Context.defined("custom-target")) {
			return;
		}
		var self = Context.resolvePath("go/Init.hx");
		var path = Path.join([ Path.directory(self), '..', '..' ]);
		// override layer first so its modules take priority over both the Go's std
		// (std/) and Haxe's std.
		var path_std = Path.join([ path, '_std' ]);
		Compiler.addClassPath(path_std);
		var pathstd = Path.join([ path, 'std' ]);
		Compiler.addClassPath(pathstd);

		var relativeOutput = Compiler.getOutput();
		var root = Sys.getCwd();
		var absoluteOutput = Path.join([ root, relativeOutput ]);

		var librariesOutput = Path.join([ absoluteOutput, "libs" ]);
		if (!FileSystem.exists(librariesOutput)) {
			FileSystem.createDirectory(librariesOutput);
		}
		Compiler.addClassPath(librariesOutput);

		var libraries = getGoLibs();
		if (libraries.length > 0 && builtLibs.join("+") != libraries.join("+")) {
			Sys.command('haxelib', ['dev', 'hx2go-extern', Path.join([path, "hx2go-extern"])]);
			Sys.command('haxelib', ['run', 'hx2go-extern'].concat(libraries).concat([librariesOutput]));
			builtLibs = libraries;
		}
	}

	static function getGoLibs():Array<String> {
		var args = Sys.args();
		var libs = [];
		var i = 0;
		while (i < args.length) {
			if (args[i] == "-D" && args[i + 1] != null && StringTools.startsWith(args[i + 1], "go-lib=")) {
				libs.push(args[i + 1].substr("go-lib=".length));
			}
			i++;
		}
		return libs;
	}
	// --custom-target go=output
    public static function init() {
		addCustomDefines();
        var anyPath = {
            pack: ["go"],
            name: "InitRandomPackage"
        };

		var newConfig: PlatformConfig = {
			staticTypeSystem: true,
			sys: true,
			capturePolicy: None, // might need WrapRef if issues happen
			padNulls: true,
			addFinalReturn: false, // prevent issues with nullability, change to true if this causes issues itself.
			overloadFunctions: false, // we don't support this
			reservedTypePaths: [],
			supportsFunctionEquality: true, // TODO: check?
			usesUtf16: false,
			thisBeforeSuper: false,
			supportsThreads: false,
			supportsUnicode: true,
			supportsRestArgs: true, // we should change this if we run into issues that are difficult to solve
			exceptions: {
				nativeThrows: [anyPath],
				nativeCatches: [anyPath],
				avoidWrapping: true,
				wildcardCatch: anyPath,
				baseThrow: anyPath,
			},
			scoping: {
				scope: BlockScope,
				flags: [
					VarHoisting,
					NoShadowing
				], // TODO: review
			},
			supportsAtomics: true
		}

		var relativeOutput = Compiler.getOutput();
		var root = Sys.getCwd();
		var absoluteOutput = Path.join([ root, relativeOutput ]);

		var archiveOutput = Path.join([ absoluteOutput, "target.hxb" ]);
		var librariesOutput = Path.join([ absoluteOutput, "libs" ]);
		var sourceOutput = Path.join([ absoluteOutput, "main" ]);
		var goModOutput = Path.join([ absoluteOutput, "main", "go.mod" ]);

		if (!FileSystem.exists(absoluteOutput)) {
			FileSystem.createDirectory(absoluteOutput);
		}


		Compiler.setPlatformConfiguration(newConfig);

		if (Context.defined("display") || Context.defined("times.macro")) {
			return;
		}

        var hxbConf: WriterConfig = {
			archivePath: archiveOutput,
			targetConfig: {
				generate: true,
				generateDocumentation: true
			}
		};
		
		Compiler.setHxbWriterConfiguration(hxbConf);
		

		Context.onAfterGenerate(() -> {
			if (!FileSystem.exists(archiveOutput)) {
				throw "cannot find HXB! something went wrong, perhaps the onAfterGenerate callback fired too early?";
			}

			if (!FileSystem.exists(sourceOutput)) {
				FileSystem.createDirectory(sourceOutput);
			}

			if (!FileSystem.exists(goModOutput)) {
				var ps = new Process("go", ["-C", sourceOutput, "mod", "init", "main"]);
				ps.exitCode(true);
				ps.close();
				// set version
				var ps = new Process("go", ["-C", sourceOutput, "mod", "edit", "-go=1.26.0"]);
				ps.exitCode(true);
				ps.close();
			}

			final mainClass = Compiler.getConfiguration().mainClass;
			final mainClassName = mainClass.pack.length > 0 ? '${mainClass.pack.join(".")}.${mainClass.name}' : '${mainClass.name}';

			var singleFile = Context.defined("go-single-file");
			var sourcelineComments = Context.defined("go-sourceline-comments");

			var self = Context.resolvePath("go/Init.hx");
			var path = Path.join([ Path.directory(self), '..', '..' ]);
			if (!Context.defined("no-compilation")) {
				if (!Context.defined("no-go-bootstrap")) {
					final bin = Path.join([ path, "output/bootstrap/main", executable("main") ]);
					var rebuild = false;
					#if rebuild
					rebuild = true;
					#elseif !no_rebuild
					if (!FileSystem.exists(bin) || Version.stale(path))
						rebuild = true;
					#end
					if (rebuild) {
						Sys.println("Creating a Go version of the compiler");
						Sys.setCwd(path);
						var code = Sys.command('haxe Bootstrap.hxml -D no-rebuild');
						if (code != 0)
							throw "bootstrap failed";
						Sys.setCwd(root);
					}
					var args = [archiveOutput, sourceOutput, mainClassName, singleFile ? "1" : "0", sourcelineComments ? "1" : "0"];
					var code = Sys.command(bin, args);
					if (code != 0)
						throw "compiler failed";
				} else {
					final bin = Path.join(["Compile-eval.hxml"]);
					var args = [bin, archiveOutput, sourceOutput, mainClassName, singleFile ? "1" : "0", sourcelineComments ? "1" : "0"];
					var oldCwd = Sys.getCwd();
					Sys.setCwd(path);
					var code = Sys.command("haxe", args);
					Sys.setCwd(oldCwd);
					if (code != 0)
						throw "compiler(eval) failed";
				}
			}
		});
    }

	static function addCustomDefines() {
		// register custom defines
		Compiler.registerCustomDefine({
			define: "no-go-bootstrap",
			doc: "do not use the bootrapped version of the compiler (running on the Go target)",
		});
		Compiler.registerCustomDefine({
			define: "go-lib",
			doc: "automatic extern generation of a given Go library",
		});
		Compiler.registerCustomDefine({
			define: "go-single-file",
			doc: "output a single Go file",
		});
		Compiler.registerCustomDefine({
			define: "go-sourceline-comments",
			doc: "output source line comments",
		});
		// register custom metadata
		Compiler.registerCustomMetadata({
			metadata: "go.Type",
			doc: "",
		});
		Compiler.registerCustomMetadata({
			metadata: "go.Tuple",
			doc: "",
		});
		Compiler.registerCustomMetadata({
			metadata: "go.Export",
			doc: "",
		});
	}

	private static function executable(path: String): String {
		return if (Sys.systemName().toLowerCase() == "windows") {
			path + '.exe';
		}else{
			path;
		}
	}
}
#end