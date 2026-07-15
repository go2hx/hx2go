package go.internal.testlog;

@:go.Type({ name: "Interface", instanceName: "testlog.Interface", imports: ["internal/testlog"] })
extern typedef Interface = {

    @:native("Chdir") function chdir(dir: String): Void;
    @:native("Getenv") function getenv(key: String): Void;
    @:native("Open") function open(file: String): Void;
    @:native("Stat") function stat(file: String): Void;

}