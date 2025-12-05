package go._internal;
#if macro
import haxe.macro.Compiler;
import haxe.macro.PlatformConfig;

class MacroPlatformConfig {
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
			addFinalReturn: false,
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
				scope: FunctionScope,
				flags: [],
			},
			supportsAtomics: true
		}
		Compiler.setPlatformConfiguration(newConfig);
	}
}
#end