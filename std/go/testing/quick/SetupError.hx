package go.testing.quick;

/**
    A SetupError is the result of an error in the way that check is being
    used, independent of the functions being tested.
**/
@:go.Type({ name: "SetupError", instanceName: "quick.SetupError", imports: ["testing/quick"] })
extern typedef SetupError = haxe.extern.EitherType<String, {
    @:native("Error") function error(): (String);

}>