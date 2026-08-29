package go.log;

/**
    Package syslog provides a simple interface to the system log
    service. It can send messages to the syslog daemon using UNIX
    domain sockets, UDP or TCP.
    
    Only one call to Dial is necessary. On write failures,
    the syslog client will attempt to reconnect to the server
    and write again.
    
    The syslog package is frozen and is not accepting new features.
    Some external packages provide more functionality. See:
    
    	https://godoc.org/?q=syslog
**/
@:go.Type({ name: "syslog", instanceName: "syslog.syslog", imports: ["log/syslog"] })
extern class Syslog {

    @:native("LOG_ALERT") static var LOG_ALERT: go.log.syslog.Priority;
    @:native("LOG_AUTH") static var LOG_AUTH: go.log.syslog.Priority;
    @:native("LOG_AUTHPRIV") static var LOG_AUTHPRIV: go.log.syslog.Priority;
    @:native("LOG_CRIT") static var LOG_CRIT: go.log.syslog.Priority;
    @:native("LOG_CRON") static var LOG_CRON: go.log.syslog.Priority;
    @:native("LOG_DAEMON") static var LOG_DAEMON: go.log.syslog.Priority;
    @:native("LOG_DEBUG") static var LOG_DEBUG: go.log.syslog.Priority;
    @:native("LOG_EMERG") static var LOG_EMERG: go.log.syslog.Priority;
    @:native("LOG_ERR") static var LOG_ERR: go.log.syslog.Priority;
    @:native("LOG_FTP") static var LOG_FTP: go.log.syslog.Priority;
    @:native("LOG_INFO") static var LOG_INFO: go.log.syslog.Priority;
    @:native("LOG_KERN") static var LOG_KERN: go.log.syslog.Priority;
    @:native("LOG_LOCAL0") static var LOG_LOCAL0: go.log.syslog.Priority;
    @:native("LOG_LOCAL1") static var LOG_LOCAL1: go.log.syslog.Priority;
    @:native("LOG_LOCAL2") static var LOG_LOCAL2: go.log.syslog.Priority;
    @:native("LOG_LOCAL3") static var LOG_LOCAL3: go.log.syslog.Priority;
    @:native("LOG_LOCAL4") static var LOG_LOCAL4: go.log.syslog.Priority;
    @:native("LOG_LOCAL5") static var LOG_LOCAL5: go.log.syslog.Priority;
    @:native("LOG_LOCAL6") static var LOG_LOCAL6: go.log.syslog.Priority;
    @:native("LOG_LOCAL7") static var LOG_LOCAL7: go.log.syslog.Priority;
    @:native("LOG_LPR") static var LOG_LPR: go.log.syslog.Priority;
    @:native("LOG_MAIL") static var LOG_MAIL: go.log.syslog.Priority;
    @:native("LOG_NEWS") static var LOG_NEWS: go.log.syslog.Priority;
    @:native("LOG_NOTICE") static var LOG_NOTICE: go.log.syslog.Priority;
    @:native("LOG_SYSLOG") static var LOG_SYSLOG: go.log.syslog.Priority;
    @:native("LOG_USER") static var LOG_USER: go.log.syslog.Priority;
    @:native("LOG_UUCP") static var LOG_UUCP: go.log.syslog.Priority;
    @:native("LOG_WARNING") static var LOG_WARNING: go.log.syslog.Priority;

    /**
        Dial establishes a connection to a log daemon by connecting to
        address raddr on the specified network. Each write to the returned
        writer sends a log message with the facility and severity
        (from priority) and tag. If tag is empty, the [os.Args][0] is used.
        If network is empty, Dial will connect to the local syslog server.
        Otherwise, see the documentation for net.Dial for valid values
        of network and raddr.
    **/
    @:native("Dial") static function dial(network: String, raddr: String, priority: go.log.syslog.Priority, tag: String): (go.Result<go.Pointer<go.log.syslog.Writer>>);
    /**
        New establishes a new connection to the system log daemon. Each
        write to the returned writer sends a log message with the given
        priority (a combination of the syslog facility and severity) and
        prefix tag. If tag is empty, the [os.Args][0] is used.
    **/
    @:native("New") static function _new(priority: go.log.syslog.Priority, tag: String): (go.Result<go.Pointer<go.log.syslog.Writer>>);
    /**
        NewLogger creates a [log.Logger] whose output is written to the
        system log service with the specified priority, a combination of
        the syslog facility and severity. The logFlag argument is the flag
        set passed through to [log.New] to create the Logger.
    **/
    @:native("NewLogger") static function newLogger(p: go.log.syslog.Priority, logFlag: go.GoInt): (go.Result<go.Pointer<go.log.Logger>>);

}