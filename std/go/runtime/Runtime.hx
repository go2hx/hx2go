package go.runtime;


import go.Result;
import go.Error;

// TODO implemnt more of runtime
@:coreType
@:notNull
@:runtimeValue
@:go.TypeAccess({name: "runtime", imports: ["runtime"]})
extern class Runtime {
        public static var GOOS:String;

}