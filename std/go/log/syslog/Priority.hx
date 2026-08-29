package go.log.syslog;

/**
    The Priority is a combination of the syslog facility and
    severity. For example, [LOG_ALERT] | [LOG_FTP] sends an alert severity
    message from the FTP facility. The default severity is [LOG_EMERG];
    the default facility is [LOG_KERN].
**/
@:go.Type({ name: "Priority", instanceName: "syslog.Priority", imports: ["log/syslog"] })
extern typedef Priority = go.GoInt