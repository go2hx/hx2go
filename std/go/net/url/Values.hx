package go.net.url;

@:go.Type({ name: "Values", instanceName: "url.Values", imports: ["net/url"] })
extern class Values {

    @:native("Add") function add(key: String, value: String): Void;
    @:native("Del") function del(key: String): Void;
    @:native("Encode") function encode(): String;
    @:native("Get") function get(key: String): String;
    @:native("Has") function has(key: String): Bool;
    @:native("Set") function set(key: String, value: String): Void;

}