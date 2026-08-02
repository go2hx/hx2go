package go.time;

@:go.Type({ name: "fileSizeError", instanceName: "time.fileSizeError", imports: ["time"] })
extern typedef FileSizeError = haxe.extern.EitherType<String, {
    @:native("Error") function error(): (String);

}>