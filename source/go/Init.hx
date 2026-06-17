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
			supportsRestArgs: false, // change to true if needed
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
					NoShadowing,
					ReserveNames([
						"func"
					]
				)], // TODO: review
			},
			supportsAtomics: true
		}

		Compiler.setPlatformConfiguration(newConfig);

        var relativeOutput = Compiler.getOutput();
        var root = Sys.getCwd();
        var absoluteOutput = Path.join([ root, relativeOutput ]);

		var archiveOutput = Path.join([ absoluteOutput, "target.hxb" ]);
		var sourceOutput = Path.join([ absoluteOutput, "main" ]);
		var goModOutput = Path.join([ absoluteOutput, "main", "go.mod" ]);

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

			hx2go.Main.exec(archiveOutput, sourceOutput);

			if (!FileSystem.exists(goModOutput)) {
				Sys.setCwd(sourceOutput);
				new Process("go", ["mod", "init", "main"]).exitCode(true);
			}
		});
    }

}
#end