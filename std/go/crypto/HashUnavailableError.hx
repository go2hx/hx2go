package go.crypto;

@:go.Type({ name: "hashUnavailableError", instanceName: "crypto.hashUnavailableError", imports: ["crypto"] })
extern typedef HashUnavailableError = haxe.extern.EitherType<go.GoUInt, {
    @:native("Error") function error(): (String);

}>