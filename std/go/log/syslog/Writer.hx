package go.log.syslog;

/**
    A Writer is a connection to a syslog server.
**/
@:structInit
@:go.Type({ name: "Writer", instanceName: "syslog.Writer", imports: ["log/syslog"] })
extern class Writer {

    /**
        Alert logs a message with severity [LOG_ALERT], ignoring the severity
        passed to New.
    **/
    @:native("Alert") function alert(m: String): (go.Error);
    /**
        Close closes a connection to the syslog daemon.
    **/
    @:native("Close") function close(): (go.Error);
    /**
        Crit logs a message with severity [LOG_CRIT], ignoring the severity
        passed to New.
    **/
    @:native("Crit") function crit(m: String): (go.Error);
    /**
        Debug logs a message with severity [LOG_DEBUG], ignoring the severity
        passed to New.
    **/
    @:native("Debug") function debug(m: String): (go.Error);
    /**
        Emerg logs a message with severity [LOG_EMERG], ignoring the severity
        passed to New.
    **/
    @:native("Emerg") function emerg(m: String): (go.Error);
    /**
        Err logs a message with severity [LOG_ERR], ignoring the severity
        passed to New.
    **/
    @:native("Err") function err(m: String): (go.Error);
    /**
        Info logs a message with severity [LOG_INFO], ignoring the severity
        passed to New.
    **/
    @:native("Info") function info(m: String): (go.Error);
    /**
        Notice logs a message with severity [LOG_NOTICE], ignoring the
        severity passed to New.
    **/
    @:native("Notice") function notice(m: String): (go.Error);
    /**
        Warning logs a message with severity [LOG_WARNING], ignoring the
        severity passed to New.
    **/
    @:native("Warning") function warning(m: String): (go.Error);
    /**
        Write sends a log message to the syslog daemon.
    **/
    @:native("Write") function write(b: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}