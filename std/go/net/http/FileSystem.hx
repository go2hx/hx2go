package go.net.http;

/**
    A FileSystem implements access to a collection of named files.
    The elements in a file path are separated by slash ('/', U+002F)
    characters, regardless of host operating system convention.
    See the [FileServer] function to convert a FileSystem to a [Handler].
    
    This interface predates the [fs.FS] interface, which can be used instead:
    the [FS] adapter function converts an fs.FS to a FileSystem.
**/
@:go.Type({ name: "FileSystem", instanceName: "http.FileSystem", imports: ["net/http"] })
extern typedef FileSystem = {

    @:native("Open") function open(name: String): (go.Result<go.net.http.File>);

}