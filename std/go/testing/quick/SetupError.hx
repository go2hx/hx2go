package go.testing.quick;

@:go.Type({ name: "SetupError", instanceName: "quick.SetupError", imports: ["testing/quick"] })
extern typedef SetupError = haxe.extern.EitherType<String, {
    @:native("Error") function error(): (String);

}>