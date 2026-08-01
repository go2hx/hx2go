package go.archive.tar;

@:go.Type({ name: "headerError", instanceName: "tar.headerError", imports: ["archive/tar"] })
extern class HeaderError {

    @:native("Error") function error(): (String);

}