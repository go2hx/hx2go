package go;
#if macro
import haxe.macro.PlatformConfig;
import haxe.macro.Compiler;
class Init {
    public static function init() {
        var whatever = {
			pack: [],
			name: "Dynamic"
		}
		var newConfig:PlatformConfig = {
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
            // runtime.LockOSThread()
            // defer runtime.UnlockOSThread()
			supportsThreads: true,
			supportsUnicode: true,
			supportsRestArgs: true,
			exceptions: {
				nativeThrows: [whatever],
				nativeCatches: [whatever],
				avoidWrapping: true,
				wildcardCatch: whatever,
				baseThrow: whatever,
			},
			scoping: {
				scope: BlockScope,
				flags: [],
			},
			supportsAtomics: true
		}
		Compiler.setPlatformConfiguration(newConfig);
    }
}
#end