package go.log.syslog;

@:structInit
@:go.Type({ name: "Writer", instanceName: "syslog.Writer", imports: ["log/syslog"] })
extern class Writer {

    @:native("Alert") function alert(m: String): go.Error;
    @:native("Close") function close(): go.Error;
    @:native("Crit") function crit(m: String): go.Error;
    @:native("Debug") function debug(m: String): go.Error;
    @:native("Emerg") function emerg(m: String): go.Error;
    @:native("Err") function err(m: String): go.Error;
    @:native("Info") function info(m: String): go.Error;
    @:native("Notice") function notice(m: String): go.Error;
    @:native("Warning") function warning(m: String): go.Error;
    @:native("Write") function write(b: go.Slice<go.Byte>): go.Result<go.GoInt>;

}