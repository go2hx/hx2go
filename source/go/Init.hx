package go;

#if (macro)
import sys.FileSystem;
import haxe.macro.PlatformConfig;
import haxe.macro.Compiler;
import haxe.macro.Context;
import haxe.Timer;
import haxe.io.Path;
import haxe.hxb.WriterConfig;
import sys.io.Process;

class Init {
	// --macro go.Init.addStd()
	public static function addStd() {
		if (!Context.defined("custom-target")) {
			return;
		}
		var self = Context.resolvePath("go/Init.hx");
		var path = Path.join([ Path.directory(self), '..', '..', 'std' ]);
		Compiler.addClassPath(path);
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
			supportsThreads: true,
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

		var libraries = getGoLibs();

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

		if (libraries.length > 0) {
			if (!FileSystem.exists(librariesOutput)) {
				FileSystem.createDirectory(librariesOutput);
			}

			Compiler.addClassPath(librariesOutput);

			for (lib in libraries) {
				Sys.command('haxelib', ['run', 'go2hx', lib, librariesOutput]);
			}
		}

		Compiler.setPlatformConfiguration(newConfig);

        var hxbConf: WriterConfig = {
			archivePath: archiveOutput,
			targetConfig: {
				generate: true,
				generateDocumentation: true
			}
		};

		// register custom defines
		Compiler.registerCustomDefine({
			define: "go-bootstrap",
			doc: "use the bootrapped version of the compiler (running on the Go target)",
		});
		Compiler.registerCustomDefine({
			define: "go-lib",
			doc: "automatic extern generation of a given Go library",
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
			}

			final mainClass = Compiler.getConfiguration().mainClass;
			final mainClassName = mainClass.pack.length > 0 ? '${mainClass.pack.join(".")}.${mainClass.name}' : '${mainClass.name}';

			var self = Context.resolvePath("go/Init.hx");
			var path = Path.join([ Path.directory(self), '..', '..' ]);

			if (Context.defined("go-bootstrap")) {
				final bin = Path.join([ path, executable("main") ]);
				if (!FileSystem.exists(bin)) {
					throw 'bootstrap executable not found';
				}
				var args = [archiveOutput, sourceOutput, mainClassName];
				var code = Sys.command(bin, args);
				if (code != 0)
					throw "bootstrap failed";
			} else {
				final bin = Path.join(["Compile-eval.hxml"]);
				var args = [bin, archiveOutput, sourceOutput, mainClassName];
				var oldCwd = Sys.getCwd();
				Sys.setCwd(path);
				var code = Sys.command("haxe", args);
				Sys.setCwd(oldCwd);
				if (code != 0)
					throw "compile eval failed";
			}
		});
    }

}

private function executable(path: String): String {
	return if (Sys.systemName().toLowerCase() == "windows") {
		path + '.exe';
	}else{
		path;
	}
}
#end