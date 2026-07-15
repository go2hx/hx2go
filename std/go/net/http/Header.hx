package go.net.http;

@:go.Type({ name: "Header", instanceName: "http.Header", imports: ["net/http"] })
extern class Header {

    @:native("Add") function add(key: String, value: String): Void;
    @:native("Clone") function clone(): go.net.http.Header;
    @:native("Del") function del(key: String): Void;
    @:native("Get") function get(key: String): String;
    @:native("Set") function set(key: String, value: String): Void;
    @:native("Values") function values(key: String): go.Slice<String>;
    @:native("Write") function write(w: go.io.Writer): go.Error;
    @:native("WriteSubset") function writeSubset(w: go.io.Writer, exclude: go.Map<String, Bool>): go.Error;

}