package go.net.textproto;

@:go.Type({ name: "MIMEHeader", instanceName: "textproto.MIMEHeader", imports: ["net/textproto"] })
extern class MIMEHeader {

    @:native("Add") function add(key: String, value: String): Void;
    @:native("Del") function del(key: String): Void;
    @:native("Get") function get(key: String): String;
    @:native("Set") function set(key: String, value: String): Void;
    @:native("Values") function values(key: String): go.Slice<String>;

}