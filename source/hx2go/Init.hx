package hx2go;

#if (macro && !go)
import sys.FileSystem;
import haxe.macro.PlatformConfig;
import haxe.macro.Compiler;
import haxe.macro.Context;
import haxe.Timer;

class Init {

    public static function init() {
        var anyPath = {
            pack: ["go"],
            name: "InitRandomPackage"
        };

		var newConfig: PlatformConfig = {
			staticTypeSystem: true,
			sys: true,
			capturePolicy: None,
			padNulls: true,
			addFinalReturn: true,
			overloadFunctions: true,
			reservedTypePaths: [],
			supportsFunctionEquality: true,
			usesUtf16: false,
			thisBeforeSuper: false,
			supportsThreads: true,
			supportsUnicode: true,
			supportsRestArgs: true,
			exceptions: {
				nativeThrows: [anyPath],
				nativeCatches: [anyPath],
				avoidWrapping: true,
				wildcardCatch: anyPath,
				baseThrow: anyPath,
			},
			scoping: {
				scope: BlockScope,
				flags: [],
			},
			supportsAtomics: true
		}

		Compiler.setPlatformConfiguration(newConfig);
		Main.main();
    }

}
#end