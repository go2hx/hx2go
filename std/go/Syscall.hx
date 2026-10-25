package go;

/**
    Package syscall contains an interface to the low-level operating system
    primitives. The details vary depending on the underlying system, and
    by default, godoc will display the syscall documentation for the current
    system. If you want godoc to display syscall documentation for another
    system, set $GOOS and $GOARCH to the desired system. For example, if
    you want to view documentation for freebsd/arm on linux/amd64, set $GOOS
    to freebsd and $GOARCH to arm.
    The primary use of syscall is inside other packages that provide a more
    portable interface to the system, such as "os", "time" and "net".  Use
    those packages rather than this one if you can.
    For details of the functions and data types in this package consult
    the manuals for the appropriate operating system.
    These calls return err == nil to indicate success; otherwise
    err is an operating system error describing the failure.
    On most systems, that error has type [Errno].
    
    NOTE: Most of the functions, types, and constants defined in
    this package are also available in the [golang.org/x/sys] package.
    That package has more system call support than this one,
    and most new code should prefer that package where possible.
    See https://golang.org/s/go1.4-syscall for more information.
**/
@:go.Type({ name: "syscall", instanceName: "syscall.syscall", imports: ["syscall"] })
extern class Syscall {

    @:native("AF_INET") static var AF_INET: go.GoInt;
    @:native("AF_INET6") static var AF_INET6: go.GoInt;
    @:native("AF_NETBIOS") static var AF_NETBIOS: go.GoInt;
    @:native("AF_UNIX") static var AF_UNIX: go.GoInt;
    @:native("AF_UNSPEC") static var AF_UNSPEC: go.GoInt;
    @:native("AI_CANONNAME") static var AI_CANONNAME: go.GoInt;
    @:native("AI_NUMERICHOST") static var AI_NUMERICHOST: go.GoInt;
    @:native("AI_PASSIVE") static var AI_PASSIVE: go.GoInt;
    /**
        Windows reserves errors >= 1<<29 for application use.
    **/
    @:native("APPLICATION_ERROR") static var APPLICATION_ERROR: go.GoInt;
    @:native("AUTHTYPE_CLIENT") static var AUTHTYPE_CLIENT: go.GoInt;
    @:native("AUTHTYPE_SERVER") static var AUTHTYPE_SERVER: go.GoInt;
    @:native("BASE_PROTOCOL") static var BASE_PROTOCOL: go.GoInt;
    @:native("CERT_CHAIN_POLICY_AUTHENTICODE") static var CERT_CHAIN_POLICY_AUTHENTICODE: go.GoInt;
    @:native("CERT_CHAIN_POLICY_AUTHENTICODE_TS") static var CERT_CHAIN_POLICY_AUTHENTICODE_TS: go.GoInt;
    @:native("CERT_CHAIN_POLICY_BASE") static var CERT_CHAIN_POLICY_BASE: go.GoInt;
    @:native("CERT_CHAIN_POLICY_BASIC_CONSTRAINTS") static var CERT_CHAIN_POLICY_BASIC_CONSTRAINTS: go.GoInt;
    @:native("CERT_CHAIN_POLICY_EV") static var CERT_CHAIN_POLICY_EV: go.GoInt;
    @:native("CERT_CHAIN_POLICY_MICROSOFT_ROOT") static var CERT_CHAIN_POLICY_MICROSOFT_ROOT: go.GoInt;
    @:native("CERT_CHAIN_POLICY_NT_AUTH") static var CERT_CHAIN_POLICY_NT_AUTH: go.GoInt;
    @:native("CERT_CHAIN_POLICY_SSL") static var CERT_CHAIN_POLICY_SSL: go.GoInt;
    @:native("CERT_E_CN_NO_MATCH") static var CERT_E_CN_NO_MATCH: go.GoInt;
    @:native("CERT_E_EXPIRED") static var CERT_E_EXPIRED: go.GoInt;
    @:native("CERT_E_PURPOSE") static var CERT_E_PURPOSE: go.GoInt;
    @:native("CERT_E_ROLE") static var CERT_E_ROLE: go.GoInt;
    @:native("CERT_E_UNTRUSTEDROOT") static var CERT_E_UNTRUSTEDROOT: go.GoInt;
    @:native("CERT_STORE_ADD_ALWAYS") static var CERT_STORE_ADD_ALWAYS: go.GoInt;
    @:native("CERT_STORE_DEFER_CLOSE_UNTIL_LAST_FREE_FLAG") static var CERT_STORE_DEFER_CLOSE_UNTIL_LAST_FREE_FLAG: go.GoInt;
    @:native("CERT_STORE_PROV_MEMORY") static var CERT_STORE_PROV_MEMORY: go.GoInt;
    @:native("CERT_TRUST_HAS_EXCLUDED_NAME_CONSTRAINT") static var CERT_TRUST_HAS_EXCLUDED_NAME_CONSTRAINT: go.GoInt;
    @:native("CERT_TRUST_HAS_NOT_DEFINED_NAME_CONSTRAINT") static var CERT_TRUST_HAS_NOT_DEFINED_NAME_CONSTRAINT: go.GoInt;
    @:native("CERT_TRUST_HAS_NOT_PERMITTED_NAME_CONSTRAINT") static var CERT_TRUST_HAS_NOT_PERMITTED_NAME_CONSTRAINT: go.GoInt;
    @:native("CERT_TRUST_HAS_NOT_SUPPORTED_CRITICAL_EXT") static var CERT_TRUST_HAS_NOT_SUPPORTED_CRITICAL_EXT: go.GoInt;
    @:native("CERT_TRUST_HAS_NOT_SUPPORTED_NAME_CONSTRAINT") static var CERT_TRUST_HAS_NOT_SUPPORTED_NAME_CONSTRAINT: go.GoInt;
    @:native("CERT_TRUST_INVALID_BASIC_CONSTRAINTS") static var CERT_TRUST_INVALID_BASIC_CONSTRAINTS: go.GoInt;
    @:native("CERT_TRUST_INVALID_EXTENSION") static var CERT_TRUST_INVALID_EXTENSION: go.GoInt;
    @:native("CERT_TRUST_INVALID_NAME_CONSTRAINTS") static var CERT_TRUST_INVALID_NAME_CONSTRAINTS: go.GoInt;
    @:native("CERT_TRUST_INVALID_POLICY_CONSTRAINTS") static var CERT_TRUST_INVALID_POLICY_CONSTRAINTS: go.GoInt;
    @:native("CERT_TRUST_IS_CYCLIC") static var CERT_TRUST_IS_CYCLIC: go.GoInt;
    @:native("CERT_TRUST_IS_EXPLICIT_DISTRUST") static var CERT_TRUST_IS_EXPLICIT_DISTRUST: go.GoInt;
    @:native("CERT_TRUST_IS_NOT_SIGNATURE_VALID") static var CERT_TRUST_IS_NOT_SIGNATURE_VALID: go.GoInt;
    @:native("CERT_TRUST_IS_NOT_TIME_VALID") static var CERT_TRUST_IS_NOT_TIME_VALID: go.GoInt;
    @:native("CERT_TRUST_IS_NOT_VALID_FOR_USAGE") static var CERT_TRUST_IS_NOT_VALID_FOR_USAGE: go.GoInt;
    @:native("CERT_TRUST_IS_OFFLINE_REVOCATION") static var CERT_TRUST_IS_OFFLINE_REVOCATION: go.GoInt;
    @:native("CERT_TRUST_IS_REVOKED") static var CERT_TRUST_IS_REVOKED: go.GoInt;
    @:native("CERT_TRUST_IS_UNTRUSTED_ROOT") static var CERT_TRUST_IS_UNTRUSTED_ROOT: go.GoInt;
    @:native("CERT_TRUST_NO_ERROR") static var CERT_TRUST_NO_ERROR: go.GoInt;
    @:native("CERT_TRUST_NO_ISSUANCE_CHAIN_POLICY") static var CERT_TRUST_NO_ISSUANCE_CHAIN_POLICY: go.GoInt;
    @:native("CERT_TRUST_REVOCATION_STATUS_UNKNOWN") static var CERT_TRUST_REVOCATION_STATUS_UNKNOWN: go.GoInt;
    @:native("CREATE_ALWAYS") static var CREATE_ALWAYS: go.GoInt;
    @:native("CREATE_NEW") static var CREATE_NEW: go.GoInt;
    @:native("CREATE_NEW_PROCESS_GROUP") static var CREATE_NEW_PROCESS_GROUP: go.GoInt;
    @:native("CREATE_UNICODE_ENVIRONMENT") static var CREATE_UNICODE_ENVIRONMENT: go.GoInt;
    @:native("CRYPT_DEFAULT_CONTAINER_OPTIONAL") static var CRYPT_DEFAULT_CONTAINER_OPTIONAL: go.GoInt;
    @:native("CRYPT_DELETEKEYSET") static var CRYPT_DELETEKEYSET: go.GoInt;
    @:native("CRYPT_MACHINE_KEYSET") static var CRYPT_MACHINE_KEYSET: go.GoInt;
    @:native("CRYPT_NEWKEYSET") static var CRYPT_NEWKEYSET: go.GoInt;
    @:native("CRYPT_SILENT") static var CRYPT_SILENT: go.GoInt;
    @:native("CRYPT_VERIFYCONTEXT") static var CRYPT_VERIFYCONTEXT: go.GoInt;
    @:native("CTRL_BREAK_EVENT") static var CTRL_BREAK_EVENT: go.GoInt;
    @:native("CTRL_CLOSE_EVENT") static var CTRL_CLOSE_EVENT: go.GoInt;
    @:native("CTRL_C_EVENT") static var CTRL_C_EVENT: go.GoInt;
    @:native("CTRL_LOGOFF_EVENT") static var CTRL_LOGOFF_EVENT: go.GoInt;
    @:native("CTRL_SHUTDOWN_EVENT") static var CTRL_SHUTDOWN_EVENT: go.GoInt;
    @:native("DNS_INFO_NO_RECORDS") static var DNS_INFO_NO_RECORDS: go.GoInt;
    @:native("DNS_TYPE_A") static var DNS_TYPE_A: go.GoInt;
    @:native("DNS_TYPE_A6") static var DNS_TYPE_A6: go.GoInt;
    @:native("DNS_TYPE_AAAA") static var DNS_TYPE_AAAA: go.GoInt;
    @:native("DNS_TYPE_ADDRS") static var DNS_TYPE_ADDRS: go.GoInt;
    @:native("DNS_TYPE_AFSDB") static var DNS_TYPE_AFSDB: go.GoInt;
    @:native("DNS_TYPE_ALL") static var DNS_TYPE_ALL: go.GoInt;
    @:native("DNS_TYPE_ANY") static var DNS_TYPE_ANY: go.GoInt;
    @:native("DNS_TYPE_ATMA") static var DNS_TYPE_ATMA: go.GoInt;
    @:native("DNS_TYPE_AXFR") static var DNS_TYPE_AXFR: go.GoInt;
    @:native("DNS_TYPE_CERT") static var DNS_TYPE_CERT: go.GoInt;
    @:native("DNS_TYPE_CNAME") static var DNS_TYPE_CNAME: go.GoInt;
    @:native("DNS_TYPE_DHCID") static var DNS_TYPE_DHCID: go.GoInt;
    @:native("DNS_TYPE_DNAME") static var DNS_TYPE_DNAME: go.GoInt;
    @:native("DNS_TYPE_DNSKEY") static var DNS_TYPE_DNSKEY: go.GoInt;
    @:native("DNS_TYPE_DS") static var DNS_TYPE_DS: go.GoInt;
    @:native("DNS_TYPE_EID") static var DNS_TYPE_EID: go.GoInt;
    @:native("DNS_TYPE_GID") static var DNS_TYPE_GID: go.GoInt;
    @:native("DNS_TYPE_GPOS") static var DNS_TYPE_GPOS: go.GoInt;
    @:native("DNS_TYPE_HINFO") static var DNS_TYPE_HINFO: go.GoInt;
    @:native("DNS_TYPE_ISDN") static var DNS_TYPE_ISDN: go.GoInt;
    @:native("DNS_TYPE_IXFR") static var DNS_TYPE_IXFR: go.GoInt;
    @:native("DNS_TYPE_KEY") static var DNS_TYPE_KEY: go.GoInt;
    @:native("DNS_TYPE_KX") static var DNS_TYPE_KX: go.GoInt;
    @:native("DNS_TYPE_LOC") static var DNS_TYPE_LOC: go.GoInt;
    @:native("DNS_TYPE_MAILA") static var DNS_TYPE_MAILA: go.GoInt;
    @:native("DNS_TYPE_MAILB") static var DNS_TYPE_MAILB: go.GoInt;
    @:native("DNS_TYPE_MB") static var DNS_TYPE_MB: go.GoInt;
    @:native("DNS_TYPE_MD") static var DNS_TYPE_MD: go.GoInt;
    @:native("DNS_TYPE_MF") static var DNS_TYPE_MF: go.GoInt;
    @:native("DNS_TYPE_MG") static var DNS_TYPE_MG: go.GoInt;
    @:native("DNS_TYPE_MINFO") static var DNS_TYPE_MINFO: go.GoInt;
    @:native("DNS_TYPE_MR") static var DNS_TYPE_MR: go.GoInt;
    @:native("DNS_TYPE_MX") static var DNS_TYPE_MX: go.GoInt;
    @:native("DNS_TYPE_NAPTR") static var DNS_TYPE_NAPTR: go.GoInt;
    @:native("DNS_TYPE_NBSTAT") static var DNS_TYPE_NBSTAT: go.GoInt;
    @:native("DNS_TYPE_NIMLOC") static var DNS_TYPE_NIMLOC: go.GoInt;
    @:native("DNS_TYPE_NS") static var DNS_TYPE_NS: go.GoInt;
    @:native("DNS_TYPE_NSAP") static var DNS_TYPE_NSAP: go.GoInt;
    @:native("DNS_TYPE_NSAPPTR") static var DNS_TYPE_NSAPPTR: go.GoInt;
    @:native("DNS_TYPE_NSEC") static var DNS_TYPE_NSEC: go.GoInt;
    @:native("DNS_TYPE_NULL") static var DNS_TYPE_NULL: go.GoInt;
    @:native("DNS_TYPE_NXT") static var DNS_TYPE_NXT: go.GoInt;
    @:native("DNS_TYPE_OPT") static var DNS_TYPE_OPT: go.GoInt;
    @:native("DNS_TYPE_PTR") static var DNS_TYPE_PTR: go.GoInt;
    @:native("DNS_TYPE_PX") static var DNS_TYPE_PX: go.GoInt;
    @:native("DNS_TYPE_RP") static var DNS_TYPE_RP: go.GoInt;
    @:native("DNS_TYPE_RRSIG") static var DNS_TYPE_RRSIG: go.GoInt;
    @:native("DNS_TYPE_RT") static var DNS_TYPE_RT: go.GoInt;
    @:native("DNS_TYPE_SIG") static var DNS_TYPE_SIG: go.GoInt;
    @:native("DNS_TYPE_SINK") static var DNS_TYPE_SINK: go.GoInt;
    @:native("DNS_TYPE_SOA") static var DNS_TYPE_SOA: go.GoInt;
    @:native("DNS_TYPE_SRV") static var DNS_TYPE_SRV: go.GoInt;
    @:native("DNS_TYPE_TEXT") static var DNS_TYPE_TEXT: go.GoInt;
    @:native("DNS_TYPE_TKEY") static var DNS_TYPE_TKEY: go.GoInt;
    @:native("DNS_TYPE_TSIG") static var DNS_TYPE_TSIG: go.GoInt;
    @:native("DNS_TYPE_UID") static var DNS_TYPE_UID: go.GoInt;
    @:native("DNS_TYPE_UINFO") static var DNS_TYPE_UINFO: go.GoInt;
    @:native("DNS_TYPE_UNSPEC") static var DNS_TYPE_UNSPEC: go.GoInt;
    @:native("DNS_TYPE_WINS") static var DNS_TYPE_WINS: go.GoInt;
    @:native("DNS_TYPE_WINSR") static var DNS_TYPE_WINSR: go.GoInt;
    @:native("DNS_TYPE_WKS") static var DNS_TYPE_WKS: go.GoInt;
    @:native("DNS_TYPE_X25") static var DNS_TYPE_X25: go.GoInt;
    @:native("DUPLICATE_CLOSE_SOURCE") static var DUPLICATE_CLOSE_SOURCE: go.GoInt;
    @:native("DUPLICATE_SAME_ACCESS") static var DUPLICATE_SAME_ACCESS: go.GoInt;
    @:native("DnsSectionAdditional") static var dnsSectionAdditional: go.GoInt;
    @:native("DnsSectionAnswer") static var dnsSectionAnswer: go.GoInt;
    @:native("DnsSectionAuthority") static var dnsSectionAuthority: go.GoInt;
    @:native("DnsSectionQuestion") static var dnsSectionQuestion: go.GoInt;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("E2BIG") static var E2BIG: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EACCES") static var EACCES: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EADDRINUSE") static var EADDRINUSE: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EADDRNOTAVAIL") static var EADDRNOTAVAIL: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EADV") static var EADV: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EAFNOSUPPORT") static var EAFNOSUPPORT: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EAGAIN") static var EAGAIN: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EALREADY") static var EALREADY: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EBADE") static var EBADE: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EBADF") static var EBADF: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EBADFD") static var EBADFD: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EBADMSG") static var EBADMSG: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EBADR") static var EBADR: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EBADRQC") static var EBADRQC: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EBADSLT") static var EBADSLT: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EBFONT") static var EBFONT: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EBUSY") static var EBUSY: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ECANCELED") static var ECANCELED: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ECHILD") static var ECHILD: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ECHRNG") static var ECHRNG: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ECOMM") static var ECOMM: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ECONNABORTED") static var ECONNABORTED: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ECONNREFUSED") static var ECONNREFUSED: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ECONNRESET") static var ECONNRESET: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EDEADLK") static var EDEADLK: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EDEADLOCK") static var EDEADLOCK: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EDESTADDRREQ") static var EDESTADDRREQ: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EDOM") static var EDOM: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EDOTDOT") static var EDOTDOT: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EDQUOT") static var EDQUOT: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EEXIST") static var EEXIST: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EFAULT") static var EFAULT: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EFBIG") static var EFBIG: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EHOSTDOWN") static var EHOSTDOWN: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EHOSTUNREACH") static var EHOSTUNREACH: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EIDRM") static var EIDRM: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EILSEQ") static var EILSEQ: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EINPROGRESS") static var EINPROGRESS: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EINTR") static var EINTR: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EINVAL") static var EINVAL: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EIO") static var EIO: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EISCONN") static var EISCONN: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EISDIR") static var EISDIR: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EISNAM") static var EISNAM: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EKEYEXPIRED") static var EKEYEXPIRED: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EKEYREJECTED") static var EKEYREJECTED: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EKEYREVOKED") static var EKEYREVOKED: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EL2HLT") static var EL2HLT: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EL2NSYNC") static var EL2NSYNC: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EL3HLT") static var EL3HLT: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EL3RST") static var EL3RST: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ELIBACC") static var ELIBACC: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ELIBBAD") static var ELIBBAD: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ELIBEXEC") static var ELIBEXEC: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ELIBMAX") static var ELIBMAX: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ELIBSCN") static var ELIBSCN: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ELNRNG") static var ELNRNG: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ELOOP") static var ELOOP: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EMEDIUMTYPE") static var EMEDIUMTYPE: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EMFILE") static var EMFILE: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EMLINK") static var EMLINK: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EMSGSIZE") static var EMSGSIZE: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EMULTIHOP") static var EMULTIHOP: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ENAMETOOLONG") static var ENAMETOOLONG: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ENAVAIL") static var ENAVAIL: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ENETDOWN") static var ENETDOWN: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ENETRESET") static var ENETRESET: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ENETUNREACH") static var ENETUNREACH: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ENFILE") static var ENFILE: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ENOANO") static var ENOANO: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ENOBUFS") static var ENOBUFS: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ENOCSI") static var ENOCSI: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ENODATA") static var ENODATA: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ENODEV") static var ENODEV: go.syscall.Errno;
    /**
        Go names for Windows errors.
    **/
    @:native("ENOENT") static var ENOENT: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ENOEXEC") static var ENOEXEC: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ENOKEY") static var ENOKEY: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ENOLCK") static var ENOLCK: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ENOLINK") static var ENOLINK: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ENOMEDIUM") static var ENOMEDIUM: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ENOMEM") static var ENOMEM: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ENOMSG") static var ENOMSG: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ENONET") static var ENONET: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ENOPKG") static var ENOPKG: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ENOPROTOOPT") static var ENOPROTOOPT: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ENOSPC") static var ENOSPC: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ENOSR") static var ENOSR: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ENOSTR") static var ENOSTR: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ENOSYS") static var ENOSYS: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ENOTBLK") static var ENOTBLK: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ENOTCONN") static var ENOTCONN: go.syscall.Errno;
    /**
        Go names for Windows errors.
    **/
    @:native("ENOTDIR") static var ENOTDIR: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ENOTEMPTY") static var ENOTEMPTY: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ENOTNAM") static var ENOTNAM: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ENOTRECOVERABLE") static var ENOTRECOVERABLE: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ENOTSOCK") static var ENOTSOCK: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ENOTSUP") static var ENOTSUP: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ENOTTY") static var ENOTTY: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ENOTUNIQ") static var ENOTUNIQ: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ENXIO") static var ENXIO: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EOPNOTSUPP") static var EOPNOTSUPP: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EOVERFLOW") static var EOVERFLOW: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EOWNERDEAD") static var EOWNERDEAD: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EPERM") static var EPERM: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EPFNOSUPPORT") static var EPFNOSUPPORT: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EPIPE") static var EPIPE: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EPROTO") static var EPROTO: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EPROTONOSUPPORT") static var EPROTONOSUPPORT: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EPROTOTYPE") static var EPROTOTYPE: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ERANGE") static var ERANGE: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EREMCHG") static var EREMCHG: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EREMOTE") static var EREMOTE: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EREMOTEIO") static var EREMOTEIO: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ERESTART") static var ERESTART: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EROFS") static var EROFS: go.syscall.Errno;
    @:native("ERROR_ACCESS_DENIED") static var ERROR_ACCESS_DENIED: go.syscall.Errno;
    @:native("ERROR_ALREADY_EXISTS") static var ERROR_ALREADY_EXISTS: go.syscall.Errno;
    @:native("ERROR_BROKEN_PIPE") static var ERROR_BROKEN_PIPE: go.syscall.Errno;
    @:native("ERROR_BUFFER_OVERFLOW") static var ERROR_BUFFER_OVERFLOW: go.syscall.Errno;
    @:native("ERROR_DIR_NOT_EMPTY") static var ERROR_DIR_NOT_EMPTY: go.syscall.Errno;
    @:native("ERROR_ENVVAR_NOT_FOUND") static var ERROR_ENVVAR_NOT_FOUND: go.syscall.Errno;
    @:native("ERROR_FILE_EXISTS") static var ERROR_FILE_EXISTS: go.syscall.Errno;
    @:native("ERROR_FILE_NOT_FOUND") static var ERROR_FILE_NOT_FOUND: go.syscall.Errno;
    @:native("ERROR_HANDLE_EOF") static var ERROR_HANDLE_EOF: go.syscall.Errno;
    @:native("ERROR_INSUFFICIENT_BUFFER") static var ERROR_INSUFFICIENT_BUFFER: go.syscall.Errno;
    @:native("ERROR_IO_PENDING") static var ERROR_IO_PENDING: go.syscall.Errno;
    @:native("ERROR_MOD_NOT_FOUND") static var ERROR_MOD_NOT_FOUND: go.syscall.Errno;
    @:native("ERROR_MORE_DATA") static var ERROR_MORE_DATA: go.syscall.Errno;
    @:native("ERROR_NETNAME_DELETED") static var ERROR_NETNAME_DELETED: go.syscall.Errno;
    @:native("ERROR_NOT_FOUND") static var ERROR_NOT_FOUND: go.syscall.Errno;
    @:native("ERROR_NO_MORE_FILES") static var ERROR_NO_MORE_FILES: go.syscall.Errno;
    @:native("ERROR_OPERATION_ABORTED") static var ERROR_OPERATION_ABORTED: go.syscall.Errno;
    @:native("ERROR_PATH_NOT_FOUND") static var ERROR_PATH_NOT_FOUND: go.syscall.Errno;
    @:native("ERROR_PRIVILEGE_NOT_HELD") static var ERROR_PRIVILEGE_NOT_HELD: go.syscall.Errno;
    @:native("ERROR_PROC_NOT_FOUND") static var ERROR_PROC_NOT_FOUND: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ESHUTDOWN") static var ESHUTDOWN: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ESOCKTNOSUPPORT") static var ESOCKTNOSUPPORT: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ESPIPE") static var ESPIPE: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ESRCH") static var ESRCH: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ESRMNT") static var ESRMNT: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ESTALE") static var ESTALE: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ESTRPIPE") static var ESTRPIPE: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ETIME") static var ETIME: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ETIMEDOUT") static var ETIMEDOUT: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ETOOMANYREFS") static var ETOOMANYREFS: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("ETXTBSY") static var ETXTBSY: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EUCLEAN") static var EUCLEAN: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EUNATCH") static var EUNATCH: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EUSERS") static var EUSERS: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EWINDOWS") static var EWINDOWS: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EWOULDBLOCK") static var EWOULDBLOCK: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EXDEV") static var EXDEV: go.syscall.Errno;
    /**
        Invented values to support what package os and others expects.
    **/
    @:native("EXFULL") static var EXFULL: go.syscall.Errno;
    @:native("FILE_ACTION_ADDED") static var FILE_ACTION_ADDED: go.GoInt;
    @:native("FILE_ACTION_MODIFIED") static var FILE_ACTION_MODIFIED: go.GoInt;
    @:native("FILE_ACTION_REMOVED") static var FILE_ACTION_REMOVED: go.GoInt;
    @:native("FILE_ACTION_RENAMED_NEW_NAME") static var FILE_ACTION_RENAMED_NEW_NAME: go.GoInt;
    @:native("FILE_ACTION_RENAMED_OLD_NAME") static var FILE_ACTION_RENAMED_OLD_NAME: go.GoInt;
    @:native("FILE_APPEND_DATA") static var FILE_APPEND_DATA: go.GoInt;
    @:native("FILE_ATTRIBUTE_ARCHIVE") static var FILE_ATTRIBUTE_ARCHIVE: go.GoInt;
    @:native("FILE_ATTRIBUTE_DIRECTORY") static var FILE_ATTRIBUTE_DIRECTORY: go.GoInt;
    @:native("FILE_ATTRIBUTE_HIDDEN") static var FILE_ATTRIBUTE_HIDDEN: go.GoInt;
    @:native("FILE_ATTRIBUTE_NORMAL") static var FILE_ATTRIBUTE_NORMAL: go.GoInt;
    @:native("FILE_ATTRIBUTE_READONLY") static var FILE_ATTRIBUTE_READONLY: go.GoInt;
    @:native("FILE_ATTRIBUTE_REPARSE_POINT") static var FILE_ATTRIBUTE_REPARSE_POINT: go.GoInt;
    @:native("FILE_ATTRIBUTE_SYSTEM") static var FILE_ATTRIBUTE_SYSTEM: go.GoInt;
    @:native("FILE_BEGIN") static var FILE_BEGIN: go.GoInt;
    @:native("FILE_CURRENT") static var FILE_CURRENT: go.GoInt;
    @:native("FILE_END") static var FILE_END: go.GoInt;
    @:native("FILE_FLAG_BACKUP_SEMANTICS") static var FILE_FLAG_BACKUP_SEMANTICS: go.GoInt;
    @:native("FILE_FLAG_OPEN_REPARSE_POINT") static var FILE_FLAG_OPEN_REPARSE_POINT: go.GoInt;
    @:native("FILE_FLAG_OVERLAPPED") static var FILE_FLAG_OVERLAPPED: go.GoInt;
    @:native("FILE_LIST_DIRECTORY") static var FILE_LIST_DIRECTORY: go.GoInt;
    @:native("FILE_MAP_COPY") static var FILE_MAP_COPY: go.GoInt;
    @:native("FILE_MAP_EXECUTE") static var FILE_MAP_EXECUTE: go.GoInt;
    @:native("FILE_MAP_READ") static var FILE_MAP_READ: go.GoInt;
    @:native("FILE_MAP_WRITE") static var FILE_MAP_WRITE: go.GoInt;
    @:native("FILE_NOTIFY_CHANGE_ATTRIBUTES") static var FILE_NOTIFY_CHANGE_ATTRIBUTES: go.GoInt;
    @:native("FILE_NOTIFY_CHANGE_CREATION") static var FILE_NOTIFY_CHANGE_CREATION: go.GoInt;
    @:native("FILE_NOTIFY_CHANGE_DIR_NAME") static var FILE_NOTIFY_CHANGE_DIR_NAME: go.GoInt;
    @:native("FILE_NOTIFY_CHANGE_FILE_NAME") static var FILE_NOTIFY_CHANGE_FILE_NAME: go.GoInt;
    @:native("FILE_NOTIFY_CHANGE_LAST_ACCESS") static var FILE_NOTIFY_CHANGE_LAST_ACCESS: go.GoInt;
    @:native("FILE_NOTIFY_CHANGE_LAST_WRITE") static var FILE_NOTIFY_CHANGE_LAST_WRITE: go.GoInt;
    @:native("FILE_NOTIFY_CHANGE_SIZE") static var FILE_NOTIFY_CHANGE_SIZE: go.GoInt;
    @:native("FILE_SHARE_DELETE") static var FILE_SHARE_DELETE: go.GoInt;
    @:native("FILE_SHARE_READ") static var FILE_SHARE_READ: go.GoInt;
    @:native("FILE_SHARE_WRITE") static var FILE_SHARE_WRITE: go.GoInt;
    @:native("FILE_SKIP_COMPLETION_PORT_ON_SUCCESS") static var FILE_SKIP_COMPLETION_PORT_ON_SUCCESS: go.GoInt;
    @:native("FILE_SKIP_SET_EVENT_ON_HANDLE") static var FILE_SKIP_SET_EVENT_ON_HANDLE: go.GoInt;
    @:native("FILE_TYPE_CHAR") static var FILE_TYPE_CHAR: go.GoInt;
    @:native("FILE_TYPE_DISK") static var FILE_TYPE_DISK: go.GoInt;
    @:native("FILE_TYPE_PIPE") static var FILE_TYPE_PIPE: go.GoInt;
    @:native("FILE_TYPE_REMOTE") static var FILE_TYPE_REMOTE: go.GoInt;
    @:native("FILE_TYPE_UNKNOWN") static var FILE_TYPE_UNKNOWN: go.GoInt;
    @:native("FILE_WRITE_ATTRIBUTES") static var FILE_WRITE_ATTRIBUTES: go.GoInt;
    @:native("FORMAT_MESSAGE_ALLOCATE_BUFFER") static var FORMAT_MESSAGE_ALLOCATE_BUFFER: go.GoInt;
    @:native("FORMAT_MESSAGE_ARGUMENT_ARRAY") static var FORMAT_MESSAGE_ARGUMENT_ARRAY: go.GoInt;
    @:native("FORMAT_MESSAGE_FROM_HMODULE") static var FORMAT_MESSAGE_FROM_HMODULE: go.GoInt;
    @:native("FORMAT_MESSAGE_FROM_STRING") static var FORMAT_MESSAGE_FROM_STRING: go.GoInt;
    @:native("FORMAT_MESSAGE_FROM_SYSTEM") static var FORMAT_MESSAGE_FROM_SYSTEM: go.GoInt;
    @:native("FORMAT_MESSAGE_IGNORE_INSERTS") static var FORMAT_MESSAGE_IGNORE_INSERTS: go.GoInt;
    @:native("FORMAT_MESSAGE_MAX_WIDTH_MASK") static var FORMAT_MESSAGE_MAX_WIDTH_MASK: go.GoInt;
    @:native("FSCTL_GET_REPARSE_POINT") static var FSCTL_GET_REPARSE_POINT: go.GoInt;
    @:native("GENERIC_ALL") static var GENERIC_ALL: go.GoInt;
    @:native("GENERIC_EXECUTE") static var GENERIC_EXECUTE: go.GoInt;
    @:native("GENERIC_READ") static var GENERIC_READ: go.GoInt;
    @:native("GENERIC_WRITE") static var GENERIC_WRITE: go.GoInt;
    @:native("GetFileExInfoStandard") static var getFileExInfoStandard: go.GoInt;
    @:native("GetFileExMaxInfoLevel") static var getFileExMaxInfoLevel: go.GoInt;
    @:native("HANDLE_FLAG_INHERIT") static var HANDLE_FLAG_INHERIT: go.GoInt;
    @:native("HKEY_CLASSES_ROOT") static var HKEY_CLASSES_ROOT: go.GoInt;
    @:native("HKEY_CURRENT_CONFIG") static var HKEY_CURRENT_CONFIG: go.GoInt;
    @:native("HKEY_CURRENT_USER") static var HKEY_CURRENT_USER: go.GoInt;
    @:native("HKEY_DYN_DATA") static var HKEY_DYN_DATA: go.GoInt;
    @:native("HKEY_LOCAL_MACHINE") static var HKEY_LOCAL_MACHINE: go.GoInt;
    @:native("HKEY_PERFORMANCE_DATA") static var HKEY_PERFORMANCE_DATA: go.GoInt;
    @:native("HKEY_USERS") static var HKEY_USERS: go.GoInt;
    @:native("IFF_BROADCAST") static var IFF_BROADCAST: go.GoInt;
    @:native("IFF_LOOPBACK") static var IFF_LOOPBACK: go.GoInt;
    @:native("IFF_MULTICAST") static var IFF_MULTICAST: go.GoInt;
    @:native("IFF_POINTTOPOINT") static var IFF_POINTTOPOINT: go.GoInt;
    @:native("IFF_UP") static var IFF_UP: go.GoInt;
    @:native("IGNORE") static var IGNORE: go.GoInt;
    @:native("INFINITE") static var INFINITE: go.GoInt;
    @:native("INVALID_FILE_ATTRIBUTES") static var INVALID_FILE_ATTRIBUTES: go.GoInt;
    @:native("IOC_IN") static var IOC_IN: go.GoInt;
    @:native("IOC_INOUT") static var IOC_INOUT: go.GoInt;
    @:native("IOC_OUT") static var IOC_OUT: go.GoInt;
    @:native("IOC_VENDOR") static var IOC_VENDOR: go.GoInt;
    @:native("IOC_WS2") static var IOC_WS2: go.GoInt;
    @:native("IO_REPARSE_TAG_SYMLINK") static var IO_REPARSE_TAG_SYMLINK: go.GoInt;
    @:native("IPPROTO_IP") static var IPPROTO_IP: go.GoInt;
    @:native("IPPROTO_IPV6") static var IPPROTO_IPV6: go.GoInt;
    @:native("IPPROTO_TCP") static var IPPROTO_TCP: go.GoInt;
    @:native("IPPROTO_UDP") static var IPPROTO_UDP: go.GoInt;
    @:native("IPV6_JOIN_GROUP") static var IPV6_JOIN_GROUP: go.GoInt;
    @:native("IPV6_LEAVE_GROUP") static var IPV6_LEAVE_GROUP: go.GoInt;
    @:native("IPV6_MULTICAST_HOPS") static var IPV6_MULTICAST_HOPS: go.GoInt;
    @:native("IPV6_MULTICAST_IF") static var IPV6_MULTICAST_IF: go.GoInt;
    @:native("IPV6_MULTICAST_LOOP") static var IPV6_MULTICAST_LOOP: go.GoInt;
    @:native("IPV6_UNICAST_HOPS") static var IPV6_UNICAST_HOPS: go.GoInt;
    @:native("IPV6_V6ONLY") static var IPV6_V6ONLY: go.GoInt;
    @:native("IP_ADD_MEMBERSHIP") static var IP_ADD_MEMBERSHIP: go.GoInt;
    @:native("IP_DROP_MEMBERSHIP") static var IP_DROP_MEMBERSHIP: go.GoInt;
    @:native("IP_MULTICAST_IF") static var IP_MULTICAST_IF: go.GoInt;
    @:native("IP_MULTICAST_LOOP") static var IP_MULTICAST_LOOP: go.GoInt;
    @:native("IP_MULTICAST_TTL") static var IP_MULTICAST_TTL: go.GoInt;
    @:native("IP_TOS") static var IP_TOS: go.GoInt;
    @:native("IP_TTL") static var IP_TTL: go.GoInt;
    @:native("ImplementsGetwd") static var implementsGetwd: Bool;
    @:native("InvalidHandle") static var invalidHandle: go.syscall.Handle;
    @:native("KEY_ALL_ACCESS") static var KEY_ALL_ACCESS: go.GoInt;
    @:native("KEY_CREATE_LINK") static var KEY_CREATE_LINK: go.GoInt;
    @:native("KEY_CREATE_SUB_KEY") static var KEY_CREATE_SUB_KEY: go.GoInt;
    @:native("KEY_ENUMERATE_SUB_KEYS") static var KEY_ENUMERATE_SUB_KEYS: go.GoInt;
    @:native("KEY_EXECUTE") static var KEY_EXECUTE: go.GoInt;
    @:native("KEY_NOTIFY") static var KEY_NOTIFY: go.GoInt;
    @:native("KEY_QUERY_VALUE") static var KEY_QUERY_VALUE: go.GoInt;
    @:native("KEY_READ") static var KEY_READ: go.GoInt;
    @:native("KEY_SET_VALUE") static var KEY_SET_VALUE: go.GoInt;
    @:native("KEY_WOW64_32KEY") static var KEY_WOW64_32KEY: go.GoInt;
    @:native("KEY_WOW64_64KEY") static var KEY_WOW64_64KEY: go.GoInt;
    @:native("KEY_WRITE") static var KEY_WRITE: go.GoInt;
    @:native("LANG_ENGLISH") static var LANG_ENGLISH: go.GoInt;
    @:native("LAYERED_PROTOCOL") static var LAYERED_PROTOCOL: go.GoInt;
    @:native("MAXIMUM_REPARSE_DATA_BUFFER_SIZE") static var MAXIMUM_REPARSE_DATA_BUFFER_SIZE: go.GoInt;
    @:native("MAXLEN_IFDESCR") static var MAXLEN_IFDESCR: go.GoInt;
    @:native("MAXLEN_PHYSADDR") static var MAXLEN_PHYSADDR: go.GoInt;
    @:native("MAX_ADAPTER_ADDRESS_LENGTH") static var MAX_ADAPTER_ADDRESS_LENGTH: go.GoInt;
    @:native("MAX_ADAPTER_DESCRIPTION_LENGTH") static var MAX_ADAPTER_DESCRIPTION_LENGTH: go.GoInt;
    @:native("MAX_ADAPTER_NAME_LENGTH") static var MAX_ADAPTER_NAME_LENGTH: go.GoInt;
    @:native("MAX_COMPUTERNAME_LENGTH") static var MAX_COMPUTERNAME_LENGTH: go.GoInt;
    @:native("MAX_INTERFACE_NAME_LEN") static var MAX_INTERFACE_NAME_LEN: go.GoInt;
    @:native("MAX_LONG_PATH") static var MAX_LONG_PATH: go.GoInt;
    @:native("MAX_PATH") static var MAX_PATH: go.GoInt;
    @:native("MAX_PROTOCOL_CHAIN") static var MAX_PROTOCOL_CHAIN: go.GoInt;
    @:native("MaxTokenInfoClass") static var maxTokenInfoClass: go.GoInt;
    @:native("NameCanonical") static var nameCanonical: go.GoInt;
    @:native("NameCanonicalEx") static var nameCanonicalEx: go.GoInt;
    @:native("NameDisplay") static var nameDisplay: go.GoInt;
    @:native("NameDnsDomain") static var nameDnsDomain: go.GoInt;
    @:native("NameFullyQualifiedDN") static var nameFullyQualifiedDN: go.GoInt;
    @:native("NameSamCompatible") static var nameSamCompatible: go.GoInt;
    @:native("NameServicePrincipal") static var nameServicePrincipal: go.GoInt;
    @:native("NameUniqueId") static var nameUniqueId: go.GoInt;
    @:native("NameUnknown") static var nameUnknown: go.GoInt;
    @:native("NameUserPrincipal") static var nameUserPrincipal: go.GoInt;
    @:native("NetSetupDomainName") static var netSetupDomainName: go.GoInt;
    @:native("NetSetupUnjoined") static var netSetupUnjoined: go.GoInt;
    @:native("NetSetupUnknownStatus") static var netSetupUnknownStatus: go.GoInt;
    @:native("NetSetupWorkgroupName") static var netSetupWorkgroupName: go.GoInt;
    @:native("OPEN_ALWAYS") static var OPEN_ALWAYS: go.GoInt;
    @:native("OPEN_EXISTING") static var OPEN_EXISTING: go.GoInt;
    @:native("O_APPEND") static var O_APPEND: go.GoInt;
    @:native("O_ASYNC") static var O_ASYNC: go.GoInt;
    @:native("O_CLOEXEC") static var O_CLOEXEC: go.GoInt;
    @:native("O_CREAT") static var O_CREAT: go.GoInt;
    @:native("O_EXCL") static var O_EXCL: go.GoInt;
    @:native("O_NOCTTY") static var O_NOCTTY: go.GoInt;
    @:native("O_NONBLOCK") static var O_NONBLOCK: go.GoInt;
    @:native("O_RDONLY") static var O_RDONLY: go.GoInt;
    @:native("O_RDWR") static var O_RDWR: go.GoInt;
    @:native("O_SYNC") static var O_SYNC: go.GoInt;
    @:native("O_TRUNC") static var O_TRUNC: go.GoInt;
    @:native("O_WRONLY") static var O_WRONLY: go.GoInt;
    @:native("PAGE_EXECUTE_READ") static var PAGE_EXECUTE_READ: go.GoInt;
    @:native("PAGE_EXECUTE_READWRITE") static var PAGE_EXECUTE_READWRITE: go.GoInt;
    @:native("PAGE_EXECUTE_WRITECOPY") static var PAGE_EXECUTE_WRITECOPY: go.GoInt;
    @:native("PAGE_READONLY") static var PAGE_READONLY: go.GoInt;
    @:native("PAGE_READWRITE") static var PAGE_READWRITE: go.GoInt;
    @:native("PAGE_WRITECOPY") static var PAGE_WRITECOPY: go.GoInt;
    @:native("PFL_HIDDEN") static var PFL_HIDDEN: go.GoInt;
    @:native("PFL_MATCHES_PROTOCOL_ZERO") static var PFL_MATCHES_PROTOCOL_ZERO: go.GoInt;
    @:native("PFL_MULTIPLE_PROTO_ENTRIES") static var PFL_MULTIPLE_PROTO_ENTRIES: go.GoInt;
    @:native("PFL_NETWORKDIRECT_PROVIDER") static var PFL_NETWORKDIRECT_PROVIDER: go.GoInt;
    @:native("PFL_RECOMMENDED_PROTO_ENTRY") static var PFL_RECOMMENDED_PROTO_ENTRY: go.GoInt;
    @:native("PKCS_7_ASN_ENCODING") static var PKCS_7_ASN_ENCODING: go.GoInt;
    @:native("PROCESS_QUERY_INFORMATION") static var PROCESS_QUERY_INFORMATION: go.GoInt;
    @:native("PROCESS_TERMINATE") static var PROCESS_TERMINATE: go.GoInt;
    @:native("PROV_DH_SCHANNEL") static var PROV_DH_SCHANNEL: go.GoInt;
    @:native("PROV_DSS") static var PROV_DSS: go.GoInt;
    @:native("PROV_DSS_DH") static var PROV_DSS_DH: go.GoInt;
    @:native("PROV_EC_ECDSA_FULL") static var PROV_EC_ECDSA_FULL: go.GoInt;
    @:native("PROV_EC_ECDSA_SIG") static var PROV_EC_ECDSA_SIG: go.GoInt;
    @:native("PROV_EC_ECNRA_FULL") static var PROV_EC_ECNRA_FULL: go.GoInt;
    @:native("PROV_EC_ECNRA_SIG") static var PROV_EC_ECNRA_SIG: go.GoInt;
    @:native("PROV_FORTEZZA") static var PROV_FORTEZZA: go.GoInt;
    @:native("PROV_INTEL_SEC") static var PROV_INTEL_SEC: go.GoInt;
    @:native("PROV_MS_EXCHANGE") static var PROV_MS_EXCHANGE: go.GoInt;
    @:native("PROV_REPLACE_OWF") static var PROV_REPLACE_OWF: go.GoInt;
    @:native("PROV_RNG") static var PROV_RNG: go.GoInt;
    @:native("PROV_RSA_AES") static var PROV_RSA_AES: go.GoInt;
    @:native("PROV_RSA_FULL") static var PROV_RSA_FULL: go.GoInt;
    @:native("PROV_RSA_SCHANNEL") static var PROV_RSA_SCHANNEL: go.GoInt;
    @:native("PROV_RSA_SIG") static var PROV_RSA_SIG: go.GoInt;
    @:native("PROV_SPYRUS_LYNKS") static var PROV_SPYRUS_LYNKS: go.GoInt;
    @:native("PROV_SSL") static var PROV_SSL: go.GoInt;
    @:native("REG_BINARY") static var REG_BINARY: go.GoInt;
    @:native("REG_DWORD") static var REG_DWORD: go.GoInt;
    @:native("REG_DWORD_BIG_ENDIAN") static var REG_DWORD_BIG_ENDIAN: go.GoInt;
    @:native("REG_DWORD_LITTLE_ENDIAN") static var REG_DWORD_LITTLE_ENDIAN: go.GoInt;
    @:native("REG_EXPAND_SZ") static var REG_EXPAND_SZ: go.GoInt;
    @:native("REG_FULL_RESOURCE_DESCRIPTOR") static var REG_FULL_RESOURCE_DESCRIPTOR: go.GoInt;
    @:native("REG_LINK") static var REG_LINK: go.GoInt;
    @:native("REG_MULTI_SZ") static var REG_MULTI_SZ: go.GoInt;
    @:native("REG_NONE") static var REG_NONE: go.GoInt;
    @:native("REG_QWORD") static var REG_QWORD: go.GoInt;
    @:native("REG_QWORD_LITTLE_ENDIAN") static var REG_QWORD_LITTLE_ENDIAN: go.GoInt;
    @:native("REG_RESOURCE_LIST") static var REG_RESOURCE_LIST: go.GoInt;
    @:native("REG_RESOURCE_REQUIREMENTS_LIST") static var REG_RESOURCE_REQUIREMENTS_LIST: go.GoInt;
    @:native("REG_SZ") static var REG_SZ: go.GoInt;
    @:native("SHUT_RD") static var SHUT_RD: go.GoInt;
    @:native("SHUT_RDWR") static var SHUT_RDWR: go.GoInt;
    @:native("SHUT_WR") static var SHUT_WR: go.GoInt;
    @:native("SIGABRT") static var SIGABRT: go.syscall.Signal;
    @:native("SIGALRM") static var SIGALRM: go.syscall.Signal;
    @:native("SIGBUS") static var SIGBUS: go.syscall.Signal;
    @:native("SIGFPE") static var SIGFPE: go.syscall.Signal;
    @:native("SIGHUP") static var SIGHUP: go.syscall.Signal;
    @:native("SIGILL") static var SIGILL: go.syscall.Signal;
    @:native("SIGINT") static var SIGINT: go.syscall.Signal;
    @:native("SIGKILL") static var SIGKILL: go.syscall.Signal;
    @:native("SIGPIPE") static var SIGPIPE: go.syscall.Signal;
    @:native("SIGQUIT") static var SIGQUIT: go.syscall.Signal;
    @:native("SIGSEGV") static var SIGSEGV: go.syscall.Signal;
    @:native("SIGTERM") static var SIGTERM: go.syscall.Signal;
    @:native("SIGTRAP") static var SIGTRAP: go.syscall.Signal;
    @:native("SIO_GET_EXTENSION_FUNCTION_POINTER") static var SIO_GET_EXTENSION_FUNCTION_POINTER: go.GoInt;
    @:native("SIO_GET_INTERFACE_LIST") static var SIO_GET_INTERFACE_LIST: go.GoInt;
    @:native("SIO_KEEPALIVE_VALS") static var SIO_KEEPALIVE_VALS: go.GoInt;
    @:native("SIO_UDP_CONNRESET") static var SIO_UDP_CONNRESET: go.GoInt;
    @:native("SOCK_DGRAM") static var SOCK_DGRAM: go.GoInt;
    @:native("SOCK_RAW") static var SOCK_RAW: go.GoInt;
    @:native("SOCK_SEQPACKET") static var SOCK_SEQPACKET: go.GoInt;
    @:native("SOCK_STREAM") static var SOCK_STREAM: go.GoInt;
    @:native("SOL_SOCKET") static var SOL_SOCKET: go.GoInt;
    @:native("SOMAXCONN") static var SOMAXCONN: go.GoInt;
    @:native("SO_BROADCAST") static var SO_BROADCAST: go.GoInt;
    @:native("SO_DONTROUTE") static var SO_DONTROUTE: go.GoInt;
    @:native("SO_KEEPALIVE") static var SO_KEEPALIVE: go.GoInt;
    @:native("SO_LINGER") static var SO_LINGER: go.GoInt;
    @:native("SO_RCVBUF") static var SO_RCVBUF: go.GoInt;
    @:native("SO_REUSEADDR") static var SO_REUSEADDR: go.GoInt;
    @:native("SO_SNDBUF") static var SO_SNDBUF: go.GoInt;
    @:native("SO_UPDATE_ACCEPT_CONTEXT") static var SO_UPDATE_ACCEPT_CONTEXT: go.GoInt;
    @:native("SO_UPDATE_CONNECT_CONTEXT") static var SO_UPDATE_CONNECT_CONTEXT: go.GoInt;
    @:native("STANDARD_RIGHTS_ALL") static var STANDARD_RIGHTS_ALL: go.GoInt;
    @:native("STANDARD_RIGHTS_EXECUTE") static var STANDARD_RIGHTS_EXECUTE: go.GoInt;
    @:native("STANDARD_RIGHTS_READ") static var STANDARD_RIGHTS_READ: go.GoInt;
    @:native("STANDARD_RIGHTS_REQUIRED") static var STANDARD_RIGHTS_REQUIRED: go.GoInt;
    @:native("STANDARD_RIGHTS_WRITE") static var STANDARD_RIGHTS_WRITE: go.GoInt;
    @:native("STARTF_USESHOWWINDOW") static var STARTF_USESHOWWINDOW: go.GoInt;
    @:native("STARTF_USESTDHANDLES") static var STARTF_USESTDHANDLES: go.GoInt;
    @:native("STD_ERROR_HANDLE") static var STD_ERROR_HANDLE: go.GoInt;
    @:native("STD_INPUT_HANDLE") static var STD_INPUT_HANDLE: go.GoInt;
    @:native("STD_OUTPUT_HANDLE") static var STD_OUTPUT_HANDLE: go.GoInt;
    @:native("SUBLANG_ENGLISH_US") static var SUBLANG_ENGLISH_US: go.GoInt;
    /**
        ShowWindow constants
    **/
    @:native("SW_FORCEMINIMIZE") static var SW_FORCEMINIMIZE: go.GoInt;
    /**
        ShowWindow constants
    **/
    @:native("SW_HIDE") static var SW_HIDE: go.GoInt;
    /**
        ShowWindow constants
    **/
    @:native("SW_MAXIMIZE") static var SW_MAXIMIZE: go.GoInt;
    /**
        ShowWindow constants
    **/
    @:native("SW_MINIMIZE") static var SW_MINIMIZE: go.GoInt;
    /**
        ShowWindow constants
    **/
    @:native("SW_NORMAL") static var SW_NORMAL: go.GoInt;
    /**
        ShowWindow constants
    **/
    @:native("SW_RESTORE") static var SW_RESTORE: go.GoInt;
    /**
        ShowWindow constants
    **/
    @:native("SW_SHOW") static var SW_SHOW: go.GoInt;
    /**
        ShowWindow constants
    **/
    @:native("SW_SHOWDEFAULT") static var SW_SHOWDEFAULT: go.GoInt;
    /**
        ShowWindow constants
    **/
    @:native("SW_SHOWMAXIMIZED") static var SW_SHOWMAXIMIZED: go.GoInt;
    /**
        ShowWindow constants
    **/
    @:native("SW_SHOWMINIMIZED") static var SW_SHOWMINIMIZED: go.GoInt;
    /**
        ShowWindow constants
    **/
    @:native("SW_SHOWMINNOACTIVE") static var SW_SHOWMINNOACTIVE: go.GoInt;
    /**
        ShowWindow constants
    **/
    @:native("SW_SHOWNA") static var SW_SHOWNA: go.GoInt;
    /**
        ShowWindow constants
    **/
    @:native("SW_SHOWNOACTIVATE") static var SW_SHOWNOACTIVATE: go.GoInt;
    /**
        ShowWindow constants
    **/
    @:native("SW_SHOWNORMAL") static var SW_SHOWNORMAL: go.GoInt;
    @:native("SYMBOLIC_LINK_FLAG_DIRECTORY") static var SYMBOLIC_LINK_FLAG_DIRECTORY: go.GoInt;
    @:native("SYNCHRONIZE") static var SYNCHRONIZE: go.GoInt;
    /**
        Invented values to support what package os expects.
    **/
    @:native("S_IFBLK") static var S_IFBLK: go.GoInt;
    /**
        Invented values to support what package os expects.
    **/
    @:native("S_IFCHR") static var S_IFCHR: go.GoInt;
    /**
        Invented values to support what package os expects.
    **/
    @:native("S_IFDIR") static var S_IFDIR: go.GoInt;
    /**
        Invented values to support what package os expects.
    **/
    @:native("S_IFIFO") static var S_IFIFO: go.GoInt;
    /**
        Invented values to support what package os expects.
    **/
    @:native("S_IFLNK") static var S_IFLNK: go.GoInt;
    /**
        Invented values to support what package os expects.
    **/
    @:native("S_IFMT") static var S_IFMT: go.GoInt;
    /**
        Invented values to support what package os expects.
    **/
    @:native("S_IFREG") static var S_IFREG: go.GoInt;
    /**
        Invented values to support what package os expects.
    **/
    @:native("S_IFSOCK") static var S_IFSOCK: go.GoInt;
    /**
        Invented values to support what package os expects.
    **/
    @:native("S_IRUSR") static var S_IRUSR: go.GoInt;
    /**
        Invented values to support what package os expects.
    **/
    @:native("S_ISGID") static var S_ISGID: go.GoInt;
    /**
        Invented values to support what package os expects.
    **/
    @:native("S_ISUID") static var S_ISUID: go.GoInt;
    /**
        Invented values to support what package os expects.
    **/
    @:native("S_ISVTX") static var S_ISVTX: go.GoInt;
    /**
        Invented values to support what package os expects.
    **/
    @:native("S_IWRITE") static var S_IWRITE: go.GoInt;
    /**
        Invented values to support what package os expects.
    **/
    @:native("S_IWUSR") static var S_IWUSR: go.GoInt;
    /**
        Invented values to support what package os expects.
    **/
    @:native("S_IXUSR") static var S_IXUSR: go.GoInt;
    @:native("SidTypeAlias") static var sidTypeAlias: go.GoInt;
    @:native("SidTypeComputer") static var sidTypeComputer: go.GoInt;
    @:native("SidTypeDeletedAccount") static var sidTypeDeletedAccount: go.GoInt;
    @:native("SidTypeDomain") static var sidTypeDomain: go.GoInt;
    @:native("SidTypeGroup") static var sidTypeGroup: go.GoInt;
    @:native("SidTypeInvalid") static var sidTypeInvalid: go.GoInt;
    @:native("SidTypeLabel") static var sidTypeLabel: go.GoInt;
    @:native("SidTypeUnknown") static var sidTypeUnknown: go.GoInt;
    @:native("SidTypeUser") static var sidTypeUser: go.GoInt;
    @:native("SidTypeWellKnownGroup") static var sidTypeWellKnownGroup: go.GoInt;
    @:native("TCP_NODELAY") static var TCP_NODELAY: go.GoInt;
    @:native("TF_DISCONNECT") static var TF_DISCONNECT: go.GoInt;
    @:native("TF_REUSE_SOCKET") static var TF_REUSE_SOCKET: go.GoInt;
    @:native("TF_USE_DEFAULT_WORKER") static var TF_USE_DEFAULT_WORKER: go.GoInt;
    @:native("TF_USE_KERNEL_APC") static var TF_USE_KERNEL_APC: go.GoInt;
    @:native("TF_USE_SYSTEM_THREAD") static var TF_USE_SYSTEM_THREAD: go.GoInt;
    @:native("TF_WRITE_BEHIND") static var TF_WRITE_BEHIND: go.GoInt;
    @:native("TH32CS_INHERIT") static var TH32CS_INHERIT: go.GoInt;
    @:native("TH32CS_SNAPALL") static var TH32CS_SNAPALL: go.GoInt;
    @:native("TH32CS_SNAPHEAPLIST") static var TH32CS_SNAPHEAPLIST: go.GoInt;
    @:native("TH32CS_SNAPMODULE") static var TH32CS_SNAPMODULE: go.GoInt;
    @:native("TH32CS_SNAPMODULE32") static var TH32CS_SNAPMODULE32: go.GoInt;
    @:native("TH32CS_SNAPPROCESS") static var TH32CS_SNAPPROCESS: go.GoInt;
    @:native("TH32CS_SNAPTHREAD") static var TH32CS_SNAPTHREAD: go.GoInt;
    @:native("TIME_ZONE_ID_DAYLIGHT") static var TIME_ZONE_ID_DAYLIGHT: go.GoInt;
    @:native("TIME_ZONE_ID_STANDARD") static var TIME_ZONE_ID_STANDARD: go.GoInt;
    @:native("TIME_ZONE_ID_UNKNOWN") static var TIME_ZONE_ID_UNKNOWN: go.GoInt;
    @:native("TOKEN_ADJUST_DEFAULT") static var TOKEN_ADJUST_DEFAULT: go.GoInt;
    @:native("TOKEN_ADJUST_GROUPS") static var TOKEN_ADJUST_GROUPS: go.GoInt;
    @:native("TOKEN_ADJUST_PRIVILEGES") static var TOKEN_ADJUST_PRIVILEGES: go.GoInt;
    @:native("TOKEN_ADJUST_SESSIONID") static var TOKEN_ADJUST_SESSIONID: go.GoInt;
    @:native("TOKEN_ALL_ACCESS") static var TOKEN_ALL_ACCESS: go.GoInt;
    @:native("TOKEN_ASSIGN_PRIMARY") static var TOKEN_ASSIGN_PRIMARY: go.GoInt;
    @:native("TOKEN_DUPLICATE") static var TOKEN_DUPLICATE: go.GoInt;
    @:native("TOKEN_EXECUTE") static var TOKEN_EXECUTE: go.GoInt;
    @:native("TOKEN_IMPERSONATE") static var TOKEN_IMPERSONATE: go.GoInt;
    @:native("TOKEN_QUERY") static var TOKEN_QUERY: go.GoInt;
    @:native("TOKEN_QUERY_SOURCE") static var TOKEN_QUERY_SOURCE: go.GoInt;
    @:native("TOKEN_READ") static var TOKEN_READ: go.GoInt;
    @:native("TOKEN_WRITE") static var TOKEN_WRITE: go.GoInt;
    @:native("TRUNCATE_EXISTING") static var TRUNCATE_EXISTING: go.GoInt;
    @:native("TokenAccessInformation") static var tokenAccessInformation: go.GoInt;
    @:native("TokenAuditPolicy") static var tokenAuditPolicy: go.GoInt;
    @:native("TokenDefaultDacl") static var tokenDefaultDacl: go.GoInt;
    @:native("TokenElevation") static var tokenElevation: go.GoInt;
    @:native("TokenElevationType") static var tokenElevationType: go.GoInt;
    @:native("TokenGroups") static var tokenGroups: go.GoInt;
    @:native("TokenGroupsAndPrivileges") static var tokenGroupsAndPrivileges: go.GoInt;
    @:native("TokenHasRestrictions") static var tokenHasRestrictions: go.GoInt;
    @:native("TokenImpersonationLevel") static var tokenImpersonationLevel: go.GoInt;
    @:native("TokenIntegrityLevel") static var tokenIntegrityLevel: go.GoInt;
    @:native("TokenLinkedToken") static var tokenLinkedToken: go.GoInt;
    @:native("TokenLogonSid") static var tokenLogonSid: go.GoInt;
    @:native("TokenMandatoryPolicy") static var tokenMandatoryPolicy: go.GoInt;
    @:native("TokenOrigin") static var tokenOrigin: go.GoInt;
    @:native("TokenOwner") static var tokenOwner: go.GoInt;
    @:native("TokenPrimaryGroup") static var tokenPrimaryGroup: go.GoInt;
    @:native("TokenPrivileges") static var tokenPrivileges: go.GoInt;
    @:native("TokenRestrictedSids") static var tokenRestrictedSids: go.GoInt;
    @:native("TokenSandBoxInert") static var tokenSandBoxInert: go.GoInt;
    @:native("TokenSessionId") static var tokenSessionId: go.GoInt;
    @:native("TokenSessionReference") static var tokenSessionReference: go.GoInt;
    @:native("TokenSource") static var tokenSource: go.GoInt;
    @:native("TokenStatistics") static var tokenStatistics: go.GoInt;
    @:native("TokenType") static var tokenType: go.GoInt;
    @:native("TokenUIAccess") static var tokenUIAccess: go.GoInt;
    @:native("TokenUser") static var tokenUser: go.GoInt;
    @:native("TokenVirtualizationAllowed") static var tokenVirtualizationAllowed: go.GoInt;
    @:native("TokenVirtualizationEnabled") static var tokenVirtualizationEnabled: go.GoInt;
    @:native("UNIX_PATH_MAX") static var UNIX_PATH_MAX: go.GoInt;
    @:native("USAGE_MATCH_TYPE_AND") static var USAGE_MATCH_TYPE_AND: go.GoInt;
    @:native("USAGE_MATCH_TYPE_OR") static var USAGE_MATCH_TYPE_OR: go.GoInt;
    @:native("WAIT_ABANDONED") static var WAIT_ABANDONED: go.GoInt;
    @:native("WAIT_FAILED") static var WAIT_FAILED: go.GoInt;
    @:native("WAIT_OBJECT_0") static var WAIT_OBJECT_0: go.GoInt;
    @:native("WAIT_TIMEOUT") static var WAIT_TIMEOUT: go.GoInt;
    @:native("WSADESCRIPTION_LEN") static var WSADESCRIPTION_LEN: go.GoInt;
    @:native("WSAEACCES") static var WSAEACCES: go.syscall.Errno;
    @:native("WSAECONNABORTED") static var WSAECONNABORTED: go.syscall.Errno;
    @:native("WSAECONNRESET") static var WSAECONNRESET: go.syscall.Errno;
    @:native("WSAENOPROTOOPT") static var WSAENOPROTOOPT: go.syscall.Errno;
    @:native("WSAPROTOCOL_LEN") static var WSAPROTOCOL_LEN: go.GoInt;
    @:native("WSASYS_STATUS_LEN") static var WSASYS_STATUS_LEN: go.GoInt;
    @:native("X509_ASN_ENCODING") static var X509_ASN_ENCODING: go.GoInt;
    @:native("XP1_CONNECTIONLESS") static var XP1_CONNECTIONLESS: go.GoInt;
    @:native("XP1_CONNECT_DATA") static var XP1_CONNECT_DATA: go.GoInt;
    @:native("XP1_DISCONNECT_DATA") static var XP1_DISCONNECT_DATA: go.GoInt;
    @:native("XP1_EXPEDITED_DATA") static var XP1_EXPEDITED_DATA: go.GoInt;
    @:native("XP1_GRACEFUL_CLOSE") static var XP1_GRACEFUL_CLOSE: go.GoInt;
    @:native("XP1_GUARANTEED_DELIVERY") static var XP1_GUARANTEED_DELIVERY: go.GoInt;
    @:native("XP1_GUARANTEED_ORDER") static var XP1_GUARANTEED_ORDER: go.GoInt;
    @:native("XP1_IFS_HANDLES") static var XP1_IFS_HANDLES: go.GoInt;
    @:native("XP1_MESSAGE_ORIENTED") static var XP1_MESSAGE_ORIENTED: go.GoInt;
    @:native("XP1_MULTIPOINT_CONTROL_PLANE") static var XP1_MULTIPOINT_CONTROL_PLANE: go.GoInt;
    @:native("XP1_MULTIPOINT_DATA_PLANE") static var XP1_MULTIPOINT_DATA_PLANE: go.GoInt;
    @:native("XP1_PARTIAL_MESSAGE") static var XP1_PARTIAL_MESSAGE: go.GoInt;
    @:native("XP1_PSEUDO_STREAM") static var XP1_PSEUDO_STREAM: go.GoInt;
    @:native("XP1_QOS_SUPPORTED") static var XP1_QOS_SUPPORTED: go.GoInt;
    @:native("XP1_SAN_SUPPORT_SDP") static var XP1_SAN_SUPPORT_SDP: go.GoInt;
    @:native("XP1_SUPPORT_BROADCAST") static var XP1_SUPPORT_BROADCAST: go.GoInt;
    @:native("XP1_SUPPORT_MULTIPOINT") static var XP1_SUPPORT_MULTIPOINT: go.GoInt;
    @:native("XP1_UNI_RECV") static var XP1_UNI_RECV: go.GoInt;
    @:native("XP1_UNI_SEND") static var XP1_UNI_SEND: go.GoInt;

    /**
        ForkLock is not used on Windows.
    **/
    @:native("ForkLock") static var forkLock: go.sync.RWMutex;
    @:native("OID_PKIX_KP_SERVER_AUTH") static var OID_PKIX_KP_SERVER_AUTH: go.Slice<go.Byte>;
    @:native("OID_SERVER_GATED_CRYPTO") static var OID_SERVER_GATED_CRYPTO: go.Slice<go.Byte>;
    @:native("OID_SGC_NETSCAPE") static var OID_SGC_NETSCAPE: go.Slice<go.Byte>;
    /**
        For testing: clients can set this flag to force
        creation of IPv6 sockets to return [EAFNOSUPPORT].
    **/
    @:native("SocketDisableIPv6") static var socketDisableIPv6: Bool;
    @:native("Stderr") static var stderr: go.syscall.Handle;
    @:native("Stdin") static var stdin: go.syscall.Handle;
    @:native("Stdout") static var stdout: go.syscall.Handle;
    @:native("WSAID_CONNECTEX") static var WSAID_CONNECTEX: go.syscall.GUID;

    @:go.Tuple("nfd", "sa", "err") @:native("Accept") static function accept(fd: go.syscall.Handle): (go.Tuple<{ nfd: go.syscall.Handle, sa: go.syscall.Sockaddr, err: go.Error }>);
    @:native("AcceptEx") static function acceptEx(ls: go.syscall.Handle, as: go.syscall.Handle, buf: go.Pointer<go.Byte>, rxdatalen: go.UInt32, laddrlen: go.UInt32, raddrlen: go.UInt32, recvd: go.Pointer<go.UInt32>, overlapped: go.Pointer<go.syscall.Overlapped>): (go.Error);
    @:native("Bind") static function bind(fd: go.syscall.Handle, sa: go.syscall.Sockaddr): (go.Error);
    /**
        BytePtrFromString returns a pointer to a NUL-terminated array of
        bytes containing the text of s. If s contains a NUL byte at any
        location, it returns (nil, [EINVAL]).
    **/
    @:native("BytePtrFromString") static function bytePtrFromString(s: String): (go.Result<go.Pointer<go.Byte>>);
    /**
        ByteSliceFromString returns a NUL-terminated slice of bytes
        containing the text of s. If s contains a NUL byte at any
        location, it returns (nil, [EINVAL]).
    **/
    @:native("ByteSliceFromString") static function byteSliceFromString(s: String): (go.Result<go.Slice<go.Byte>>);
    @:native("CancelIo") static function cancelIo(s: go.syscall.Handle): (go.Error);
    @:native("CancelIoEx") static function cancelIoEx(s: go.syscall.Handle, o: go.Pointer<go.syscall.Overlapped>): (go.Error);
    @:native("CertAddCertificateContextToStore") static function certAddCertificateContextToStore(store: go.syscall.Handle, certContext: go.Pointer<go.syscall.CertContext>, addDisposition: go.UInt32, storeContext: go.Pointer<go.Pointer<go.syscall.CertContext>>): (go.Error);
    @:native("CertCloseStore") static function certCloseStore(store: go.syscall.Handle, flags: go.UInt32): (go.Error);
    @:native("CertCreateCertificateContext") static function certCreateCertificateContext(certEncodingType: go.UInt32, certEncoded: go.Pointer<go.Byte>, encodedLen: go.UInt32): (go.Result<go.Pointer<go.syscall.CertContext>>);
    @:native("CertEnumCertificatesInStore") static function certEnumCertificatesInStore(store: go.syscall.Handle, prevContext: go.Pointer<go.syscall.CertContext>): (go.Result<go.Pointer<go.syscall.CertContext>>);
    @:native("CertFreeCertificateChain") static function certFreeCertificateChain(ctx: go.Pointer<go.syscall.CertChainContext>): Void;
    @:native("CertFreeCertificateContext") static function certFreeCertificateContext(ctx: go.Pointer<go.syscall.CertContext>): (go.Error);
    @:native("CertGetCertificateChain") static function certGetCertificateChain(engine: go.syscall.Handle, leaf: go.Pointer<go.syscall.CertContext>, time: go.Pointer<go.syscall.Filetime>, additionalStore: go.syscall.Handle, para: go.Pointer<go.syscall.CertChainPara>, flags: go.UInt32, reserved: go.UIntPtr, chainCtx: go.Pointer<go.Pointer<go.syscall.CertChainContext>>): (go.Error);
    @:native("CertOpenStore") static function certOpenStore(storeProvider: go.UIntPtr, msgAndCertEncodingType: go.UInt32, cryptProv: go.UIntPtr, flags: go.UInt32, para: go.UIntPtr): (go.Result<go.syscall.Handle>);
    @:native("CertOpenSystemStore") static function certOpenSystemStore(hprov: go.syscall.Handle, name: go.Pointer<go.UInt16>): (go.Result<go.syscall.Handle>);
    @:native("CertVerifyCertificateChainPolicy") static function certVerifyCertificateChainPolicy(policyOID: go.UIntPtr, chain: go.Pointer<go.syscall.CertChainContext>, para: go.Pointer<go.syscall.CertChainPolicyPara>, status: go.Pointer<go.syscall.CertChainPolicyStatus>): (go.Error);
    @:native("Chdir") static function chdir(path: String): (go.Error);
    @:native("Chmod") static function chmod(path: String, mode: go.UInt32): (go.Error);
    @:native("Chown") static function chown(path: String, uid: go.GoInt, gid: go.GoInt): (go.Error);
    @:native("Clearenv") static function clearenv(): Void;
    @:native("Close") static function close(fd: go.syscall.Handle): (go.Error);
    @:native("CloseHandle") static function closeHandle(handle: go.syscall.Handle): (go.Error);
    @:native("CloseOnExec") static function closeOnExec(fd: go.syscall.Handle): Void;
    @:native("Closesocket") static function closesocket(s: go.syscall.Handle): (go.Error);
    @:native("CommandLineToArgv") static function commandLineToArgv(cmd: go.Pointer<go.UInt16>, argc: go.Pointer<go.Int32>): (go.Result<go.Pointer<go.GoArray<go.Pointer<go.GoArray<go.UInt16, 8192>>, 8192>>>);
    @:native("ComputerName") static function computerName(): (go.Result<String>);
    @:native("Connect") static function connect(fd: go.syscall.Handle, sa: go.syscall.Sockaddr): (go.Error);
    @:native("ConnectEx") static function connectEx(fd: go.syscall.Handle, sa: go.syscall.Sockaddr, sendBuf: go.Pointer<go.Byte>, sendDataLen: go.UInt32, bytesSent: go.Pointer<go.UInt32>, overlapped: go.Pointer<go.syscall.Overlapped>): (go.Error);
    @:native("ConvertSidToStringSid") static function convertSidToStringSid(sid: go.Pointer<go.syscall.SID>, stringSid: go.Pointer<go.Pointer<go.UInt16>>): (go.Error);
    @:native("ConvertStringSidToSid") static function convertStringSidToSid(stringSid: go.Pointer<go.UInt16>, sid: go.Pointer<go.Pointer<go.syscall.SID>>): (go.Error);
    @:native("CopySid") static function copySid(destSidLen: go.UInt32, destSid: go.Pointer<go.syscall.SID>, srcSid: go.Pointer<go.syscall.SID>): (go.Error);
    @:native("CreateDirectory") static function createDirectory(path: go.Pointer<go.UInt16>, sa: go.Pointer<go.syscall.SecurityAttributes>): (go.Error);
    @:native("CreateFile") static function createFile(name: go.Pointer<go.UInt16>, access: go.UInt32, mode: go.UInt32, sa: go.Pointer<go.syscall.SecurityAttributes>, createmode: go.UInt32, attrs: go.UInt32, templatefile: go.Int32): (go.Result<go.syscall.Handle>);
    @:native("CreateFileMapping") static function createFileMapping(fhandle: go.syscall.Handle, sa: go.Pointer<go.syscall.SecurityAttributes>, prot: go.UInt32, maxSizeHigh: go.UInt32, maxSizeLow: go.UInt32, name: go.Pointer<go.UInt16>): (go.Result<go.syscall.Handle>);
    @:native("CreateHardLink") static function createHardLink(filename: go.Pointer<go.UInt16>, existingfilename: go.Pointer<go.UInt16>, reserved: go.UIntPtr): (go.Error);
    /**
        Deprecated: CreateIoCompletionPort has the wrong function signature. Use x/sys/windows.CreateIoCompletionPort.
    **/
    @:native("CreateIoCompletionPort") static function createIoCompletionPort(filehandle: go.syscall.Handle, cphandle: go.syscall.Handle, key: go.UInt32, threadcnt: go.UInt32): (go.Result<go.syscall.Handle>);
    @:native("CreatePipe") static function createPipe(readhandle: go.Pointer<go.syscall.Handle>, writehandle: go.Pointer<go.syscall.Handle>, sa: go.Pointer<go.syscall.SecurityAttributes>, size: go.UInt32): (go.Error);
    @:native("CreateProcess") static function createProcess(appName: go.Pointer<go.UInt16>, commandLine: go.Pointer<go.UInt16>, procSecurity: go.Pointer<go.syscall.SecurityAttributes>, threadSecurity: go.Pointer<go.syscall.SecurityAttributes>, inheritHandles: Bool, creationFlags: go.UInt32, env: go.Pointer<go.UInt16>, currentDir: go.Pointer<go.UInt16>, startupInfo: go.Pointer<go.syscall.StartupInfo>, outProcInfo: go.Pointer<go.syscall.ProcessInformation>): (go.Error);
    @:native("CreateProcessAsUser") static function createProcessAsUser(token: go.syscall.Token, appName: go.Pointer<go.UInt16>, commandLine: go.Pointer<go.UInt16>, procSecurity: go.Pointer<go.syscall.SecurityAttributes>, threadSecurity: go.Pointer<go.syscall.SecurityAttributes>, inheritHandles: Bool, creationFlags: go.UInt32, env: go.Pointer<go.UInt16>, currentDir: go.Pointer<go.UInt16>, startupInfo: go.Pointer<go.syscall.StartupInfo>, outProcInfo: go.Pointer<go.syscall.ProcessInformation>): (go.Error);
    @:native("CreateSymbolicLink") static function createSymbolicLink(symlinkfilename: go.Pointer<go.UInt16>, targetfilename: go.Pointer<go.UInt16>, flags: go.UInt32): (go.Error);
    @:native("CreateToolhelp32Snapshot") static function createToolhelp32Snapshot(flags: go.UInt32, processId: go.UInt32): (go.Result<go.syscall.Handle>);
    @:native("CryptAcquireContext") static function cryptAcquireContext(provhandle: go.Pointer<go.syscall.Handle>, container: go.Pointer<go.UInt16>, provider: go.Pointer<go.UInt16>, provtype: go.UInt32, flags: go.UInt32): (go.Error);
    @:native("CryptGenRandom") static function cryptGenRandom(provhandle: go.syscall.Handle, buflen: go.UInt32, buf: go.Pointer<go.Byte>): (go.Error);
    @:native("CryptReleaseContext") static function cryptReleaseContext(provhandle: go.syscall.Handle, flags: go.UInt32): (go.Error);
    @:native("DeleteFile") static function deleteFile(path: go.Pointer<go.UInt16>): (go.Error);
    @:native("DeviceIoControl") static function deviceIoControl(handle: go.syscall.Handle, ioControlCode: go.UInt32, inBuffer: go.Pointer<go.Byte>, inBufferSize: go.UInt32, outBuffer: go.Pointer<go.Byte>, outBufferSize: go.UInt32, bytesReturned: go.Pointer<go.UInt32>, overlapped: go.Pointer<go.syscall.Overlapped>): (go.Error);
    @:native("DnsNameCompare") static function dnsNameCompare(name1: go.Pointer<go.UInt16>, name2: go.Pointer<go.UInt16>): (Bool);
    @:native("DnsQuery") static function dnsQuery(name: String, qtype: go.UInt16, options: go.UInt32, extra: go.Pointer<go.Byte>, qrs: go.Pointer<go.Pointer<go.syscall.DNSRecord>>, pr: go.Pointer<go.Byte>): (go.Error);
    @:native("DnsRecordListFree") static function dnsRecordListFree(rl: go.Pointer<go.syscall.DNSRecord>, freetype: go.UInt32): Void;
    @:native("DuplicateHandle") static function duplicateHandle(hSourceProcessHandle: go.syscall.Handle, hSourceHandle: go.syscall.Handle, hTargetProcessHandle: go.syscall.Handle, lpTargetHandle: go.Pointer<go.syscall.Handle>, dwDesiredAccess: go.UInt32, bInheritHandle: Bool, dwOptions: go.UInt32): (go.Error);
    @:native("Environ") static function environ(): (go.Slice<String>);
    /**
        EscapeArg rewrites command line argument s as prescribed
        in https://msdn.microsoft.com/en-us/library/ms880421.
        This function returns "" (2 double quotes) if s is empty.
        Alternatively, these transformations are done:
          - every back slash (\) is doubled, but only if immediately
            followed by double quote (");
          - every double quote (") is escaped by back slash (\);
          - finally, s is wrapped with double quotes (arg -> "arg"),
            but only if there is space or tab inside s.
    **/
    @:native("EscapeArg") static function escapeArg(s: String): (String);
    @:native("Exec") static function exec(argv0: String, argv: go.Slice<String>, envv: go.Slice<String>): (go.Error);
    @:native("Exit") static function exit(code: go.GoInt): Void;
    @:native("ExitProcess") static function exitProcess(exitcode: go.UInt32): Void;
    @:native("Fchdir") static function fchdir(fd: go.syscall.Handle): (go.Error);
    @:native("Fchmod") static function fchmod(fd: go.syscall.Handle, mode: go.UInt32): (go.Error);
    @:native("Fchown") static function fchown(fd: go.syscall.Handle, uid: go.GoInt, gid: go.GoInt): (go.Error);
    @:native("FindClose") static function findClose(handle: go.syscall.Handle): (go.Error);
    @:native("FindFirstFile") static function findFirstFile(name: go.Pointer<go.UInt16>, data: go.Pointer<go.syscall.Win32finddata>): (go.Result<go.syscall.Handle>);
    @:native("FindNextFile") static function findNextFile(handle: go.syscall.Handle, data: go.Pointer<go.syscall.Win32finddata>): (go.Error);
    @:native("FlushFileBuffers") static function flushFileBuffers(handle: go.syscall.Handle): (go.Error);
    @:native("FlushViewOfFile") static function flushViewOfFile(addr: go.UIntPtr, length: go.UIntPtr): (go.Error);
    /**
        FormatMessage is deprecated (msgsrc should be uintptr, not uint32, but can
        not be changed due to the Go 1 compatibility guarantee).
        
        Deprecated: Use FormatMessage from golang.org/x/sys/windows instead.
    **/
    @:native("FormatMessage") static function formatMessage(flags: go.UInt32, msgsrc: go.UInt32, msgid: go.UInt32, langid: go.UInt32, buf: go.Slice<go.UInt16>, args: go.Pointer<go.Byte>): (go.Result<go.UInt32>);
    @:native("FreeAddrInfoW") static function freeAddrInfoW(addrinfo: go.Pointer<go.syscall.AddrinfoW>): Void;
    @:native("FreeEnvironmentStrings") static function freeEnvironmentStrings(envs: go.Pointer<go.UInt16>): (go.Error);
    @:native("FreeLibrary") static function freeLibrary(handle: go.syscall.Handle): (go.Error);
    @:native("Fsync") static function fsync(fd: go.syscall.Handle): (go.Error);
    @:native("Ftruncate") static function ftruncate(fd: go.syscall.Handle, length: go.Int64): (go.Error);
    /**
        FullPath retrieves the full path of the specified file.
    **/
    @:native("FullPath") static function fullPath(name: String): (go.Result<String>);
    @:native("GetAcceptExSockaddrs") static function getAcceptExSockaddrs(buf: go.Pointer<go.Byte>, rxdatalen: go.UInt32, laddrlen: go.UInt32, raddrlen: go.UInt32, lrsa: go.Pointer<go.Pointer<go.syscall.RawSockaddrAny>>, lrsalen: go.Pointer<go.Int32>, rrsa: go.Pointer<go.Pointer<go.syscall.RawSockaddrAny>>, rrsalen: go.Pointer<go.Int32>): Void;
    @:native("GetAdaptersInfo") static function getAdaptersInfo(ai: go.Pointer<go.syscall.IpAdapterInfo>, ol: go.Pointer<go.UInt32>): (go.Error);
    @:native("GetAddrInfoW") static function getAddrInfoW(nodename: go.Pointer<go.UInt16>, servicename: go.Pointer<go.UInt16>, hints: go.Pointer<go.syscall.AddrinfoW>, result: go.Pointer<go.Pointer<go.syscall.AddrinfoW>>): (go.Error);
    @:native("GetCommandLine") static function getCommandLine(): (go.Pointer<go.UInt16>);
    @:native("GetComputerName") static function getComputerName(buf: go.Pointer<go.UInt16>, n: go.Pointer<go.UInt32>): (go.Error);
    @:native("GetConsoleMode") static function getConsoleMode(console: go.syscall.Handle, mode: go.Pointer<go.UInt32>): (go.Error);
    @:native("GetCurrentDirectory") static function getCurrentDirectory(buflen: go.UInt32, buf: go.Pointer<go.UInt16>): (go.Result<go.UInt32>);
    @:native("GetCurrentProcess") static function getCurrentProcess(): (go.Result<go.syscall.Handle>);
    @:native("GetEnvironmentStrings") static function getEnvironmentStrings(): (go.Result<go.Pointer<go.UInt16>>);
    @:native("GetEnvironmentVariable") static function getEnvironmentVariable(name: go.Pointer<go.UInt16>, buffer: go.Pointer<go.UInt16>, size: go.UInt32): (go.Result<go.UInt32>);
    @:native("GetExitCodeProcess") static function getExitCodeProcess(handle: go.syscall.Handle, exitcode: go.Pointer<go.UInt32>): (go.Error);
    @:native("GetFileAttributes") static function getFileAttributes(name: go.Pointer<go.UInt16>): (go.Result<go.UInt32>);
    @:native("GetFileAttributesEx") static function getFileAttributesEx(name: go.Pointer<go.UInt16>, level: go.UInt32, info: go.Pointer<go.Byte>): (go.Error);
    @:native("GetFileInformationByHandle") static function getFileInformationByHandle(handle: go.syscall.Handle, data: go.Pointer<go.syscall.ByHandleFileInformation>): (go.Error);
    @:native("GetFileType") static function getFileType(filehandle: go.syscall.Handle): (go.Result<go.UInt32>);
    @:native("GetFullPathName") static function getFullPathName(path: go.Pointer<go.UInt16>, buflen: go.UInt32, buf: go.Pointer<go.UInt16>, fname: go.Pointer<go.Pointer<go.UInt16>>): (go.Result<go.UInt32>);
    @:native("GetHostByName") static function getHostByName(name: String): (go.Result<go.Pointer<go.syscall.Hostent>>);
    @:native("GetIfEntry") static function getIfEntry(pIfRow: go.Pointer<go.syscall.MibIfRow>): (go.Error);
    @:native("GetLastError") static function getLastError(): (go.Error);
    @:native("GetLengthSid") static function getLengthSid(sid: go.Pointer<go.syscall.SID>): (go.UInt32);
    @:native("GetLongPathName") static function getLongPathName(path: go.Pointer<go.UInt16>, buf: go.Pointer<go.UInt16>, buflen: go.UInt32): (go.Result<go.UInt32>);
    @:native("GetProcAddress") static function getProcAddress(module: go.syscall.Handle, procname: String): (go.Result<go.UIntPtr>);
    @:native("GetProcessTimes") static function getProcessTimes(handle: go.syscall.Handle, creationTime: go.Pointer<go.syscall.Filetime>, exitTime: go.Pointer<go.syscall.Filetime>, kernelTime: go.Pointer<go.syscall.Filetime>, userTime: go.Pointer<go.syscall.Filetime>): (go.Error);
    @:native("GetProtoByName") static function getProtoByName(name: String): (go.Result<go.Pointer<go.syscall.Protoent>>);
    /**
        Deprecated: GetQueuedCompletionStatus has the wrong function signature. Use x/sys/windows.GetQueuedCompletionStatus.
    **/
    @:native("GetQueuedCompletionStatus") static function getQueuedCompletionStatus(cphandle: go.syscall.Handle, qty: go.Pointer<go.UInt32>, key: go.Pointer<go.UInt32>, overlapped: go.Pointer<go.Pointer<go.syscall.Overlapped>>, timeout: go.UInt32): (go.Error);
    @:native("GetServByName") static function getServByName(name: String, proto: String): (go.Result<go.Pointer<go.syscall.Servent>>);
    @:native("GetShortPathName") static function getShortPathName(longpath: go.Pointer<go.UInt16>, shortpath: go.Pointer<go.UInt16>, buflen: go.UInt32): (go.Result<go.UInt32>);
    @:native("GetStartupInfo") static function getStartupInfo(startupInfo: go.Pointer<go.syscall.StartupInfo>): (go.Error);
    @:native("GetStdHandle") static function getStdHandle(stdhandle: go.GoInt): (go.Result<go.syscall.Handle>);
    @:native("GetSystemTimeAsFileTime") static function getSystemTimeAsFileTime(time: go.Pointer<go.syscall.Filetime>): Void;
    @:native("GetTempPath") static function getTempPath(buflen: go.UInt32, buf: go.Pointer<go.UInt16>): (go.Result<go.UInt32>);
    @:native("GetTimeZoneInformation") static function getTimeZoneInformation(tzi: go.Pointer<go.syscall.Timezoneinformation>): (go.Result<go.UInt32>);
    @:native("GetTokenInformation") static function getTokenInformation(t: go.syscall.Token, infoClass: go.UInt32, info: go.Pointer<go.Byte>, infoLen: go.UInt32, returnedLen: go.Pointer<go.UInt32>): (go.Error);
    @:native("GetUserNameEx") static function getUserNameEx(nameFormat: go.UInt32, nameBuffre: go.Pointer<go.UInt16>, nSize: go.Pointer<go.UInt32>): (go.Error);
    @:native("GetUserProfileDirectory") static function getUserProfileDirectory(t: go.syscall.Token, dir: go.Pointer<go.UInt16>, dirLen: go.Pointer<go.UInt32>): (go.Error);
    @:native("GetVersion") static function getVersion(): (go.Result<go.UInt32>);
    @:native("Getegid") static function getegid(): (go.GoInt);
    @:go.Tuple("value", "found") @:native("Getenv") static function getenv(key: String): (go.Tuple<{ value: String, found: Bool }>);
    @:native("Geteuid") static function geteuid(): (go.GoInt);
    @:native("Getgid") static function getgid(): (go.GoInt);
    @:native("Getgroups") static function getgroups(): (go.Result<go.Slice<go.GoInt>>);
    @:native("Getpagesize") static function getpagesize(): (go.GoInt);
    @:native("Getpeername") static function getpeername(fd: go.syscall.Handle): (go.Result<go.syscall.Sockaddr>);
    @:native("Getpid") static function getpid(): (go.GoInt);
    @:native("Getppid") static function getppid(): (go.GoInt);
    @:native("Getsockname") static function getsockname(fd: go.syscall.Handle): (go.Result<go.syscall.Sockaddr>);
    @:native("Getsockopt") static function getsockopt(s: go.syscall.Handle, level: go.Int32, optname: go.Int32, optval: go.Pointer<go.Byte>, optlen: go.Pointer<go.Int32>): (go.Error);
    @:native("GetsockoptInt") static function getsockoptInt(fd: go.syscall.Handle, level: go.GoInt, opt: go.GoInt): (go.Result<go.GoInt>);
    @:native("Gettimeofday") static function gettimeofday(tv: go.Pointer<go.syscall.Timeval>): (go.Error);
    @:native("Getuid") static function getuid(): (go.GoInt);
    @:native("Getwd") static function getwd(): (go.Result<String>);
    @:native("Lchown") static function lchown(path: String, uid: go.GoInt, gid: go.GoInt): (go.Error);
    /**
        TODO(brainman): fix all needed for os
    **/
    @:native("Link") static function link(oldpath: String, newpath: String): (go.Error);
    @:native("Listen") static function listen(s: go.syscall.Handle, n: go.GoInt): (go.Error);
    @:native("LoadCancelIoEx") static function loadCancelIoEx(): (go.Error);
    @:native("LoadConnectEx") static function loadConnectEx(): (go.Error);
    @:native("LoadCreateSymbolicLink") static function loadCreateSymbolicLink(): (go.Error);
    /**
        LoadDLL loads the named DLL file into memory.
        
        If name is not an absolute path and is not a known system DLL used by
        Go, Windows will search for the named DLL in many locations, causing
        potential DLL preloading attacks.
        
        Use [LazyDLL] in golang.org/x/sys/windows for a secure way to
        load system DLLs.
    **/
    @:native("LoadDLL") static function loadDLL(name: String): (go.Result<go.Pointer<go.syscall.DLL>>);
    @:native("LoadGetAddrInfo") static function loadGetAddrInfo(): (go.Error);
    @:native("LoadLibrary") static function loadLibrary(libname: String): (go.Result<go.syscall.Handle>);
    @:native("LoadSetFileCompletionNotificationModes") static function loadSetFileCompletionNotificationModes(): (go.Error);
    @:native("LocalFree") static function localFree(hmem: go.syscall.Handle): (go.Result<go.syscall.Handle>);
    @:native("LookupAccountName") static function lookupAccountName(systemName: go.Pointer<go.UInt16>, accountName: go.Pointer<go.UInt16>, sid: go.Pointer<go.syscall.SID>, sidLen: go.Pointer<go.UInt32>, refdDomainName: go.Pointer<go.UInt16>, refdDomainNameLen: go.Pointer<go.UInt32>, use: go.Pointer<go.UInt32>): (go.Error);
    @:native("LookupAccountSid") static function lookupAccountSid(systemName: go.Pointer<go.UInt16>, sid: go.Pointer<go.syscall.SID>, name: go.Pointer<go.UInt16>, nameLen: go.Pointer<go.UInt32>, refdDomainName: go.Pointer<go.UInt16>, refdDomainNameLen: go.Pointer<go.UInt32>, use: go.Pointer<go.UInt32>): (go.Error);
    /**
        LookupSID retrieves a security identifier sid for the account
        and the name of the domain on which the account was found.
        System specify target computer to search.
    **/
    @:go.Tuple("sid", "domain", "accType", "err") @:native("LookupSID") static function lookupSID(system: String, account: String): (go.Tuple<{ sid: go.Pointer<go.syscall.SID>, domain: String, accType: go.UInt32, err: go.Error }>);
    @:native("MapViewOfFile") static function mapViewOfFile(handle: go.syscall.Handle, access: go.UInt32, offsetHigh: go.UInt32, offsetLow: go.UInt32, length: go.UIntPtr): (go.Result<go.UIntPtr>);
    @:native("Mkdir") static function mkdir(path: String, mode: go.UInt32): (go.Error);
    @:native("MoveFile") static function moveFile(_from: go.Pointer<go.UInt16>, _to: go.Pointer<go.UInt16>): (go.Error);
    /**
        MustLoadDLL is like [LoadDLL] but panics if load operation fails.
    **/
    @:native("MustLoadDLL") static function mustLoadDLL(name: String): (go.Pointer<go.syscall.DLL>);
    @:native("NetApiBufferFree") static function netApiBufferFree(buf: go.Pointer<go.Byte>): (go.Error);
    @:native("NetGetJoinInformation") static function netGetJoinInformation(server: go.Pointer<go.UInt16>, name: go.Pointer<go.Pointer<go.UInt16>>, bufType: go.Pointer<go.UInt32>): (go.Error);
    @:native("NetUserGetInfo") static function netUserGetInfo(serverName: go.Pointer<go.UInt16>, userName: go.Pointer<go.UInt16>, level: go.UInt32, buf: go.Pointer<go.Pointer<go.Byte>>): (go.Error);
    /**
        NewCallback converts a Go function to a function pointer conforming to the stdcall calling convention.
        This is useful when interoperating with Windows code requiring callbacks.
        The argument is expected to be a function with one uintptr-sized result. The function must not have arguments with size larger than the size of uintptr.
        Only a limited number of callbacks may be created in a single Go process, and any memory allocated
        for these callbacks is never released.
        Between NewCallback and NewCallbackCDecl, at least 1024 callbacks can always be created.
    **/
    @:native("NewCallback") static function newCallback(fn: Dynamic): (go.UIntPtr);
    /**
        NewCallbackCDecl converts a Go function to a function pointer conforming to the cdecl calling convention.
        This is useful when interoperating with Windows code requiring callbacks.
        The argument is expected to be a function with one uintptr-sized result. The function must not have arguments with size larger than the size of uintptr.
        Only a limited number of callbacks may be created in a single Go process, and any memory allocated
        for these callbacks is never released.
        Between NewCallback and NewCallbackCDecl, at least 1024 callbacks can always be created.
    **/
    @:native("NewCallbackCDecl") static function newCallbackCDecl(fn: Dynamic): (go.UIntPtr);
    /**
        NewLazyDLL creates new [LazyDLL] associated with [DLL] file.
    **/
    @:native("NewLazyDLL") static function newLazyDLL(name: String): (go.Pointer<go.syscall.LazyDLL>);
    @:native("NsecToFiletime") static function nsecToFiletime(nsec: go.Int64): (go.syscall.Filetime);
    @:native("NsecToTimespec") static function nsecToTimespec(nsec: go.Int64): (go.syscall.Timespec);
    @:native("NsecToTimeval") static function nsecToTimeval(nsec: go.Int64): (go.syscall.Timeval);
    @:native("Ntohs") static function ntohs(netshort: go.UInt16): (go.UInt16);
    @:native("Open") static function open(name: String, flag: go.GoInt, perm: go.UInt32): (go.Result<go.syscall.Handle>);
    /**
        OpenCurrentProcessToken opens the access token
        associated with current process.
    **/
    @:native("OpenCurrentProcessToken") static function openCurrentProcessToken(): (go.Result<go.syscall.Token>);
    @:native("OpenProcess") static function openProcess(da: go.UInt32, inheritHandle: Bool, pid: go.UInt32): (go.Result<go.syscall.Handle>);
    @:native("OpenProcessToken") static function openProcessToken(h: go.syscall.Handle, access: go.UInt32, token: go.Pointer<go.syscall.Token>): (go.Error);
    @:native("Pipe") static function pipe(p: go.Slice<go.syscall.Handle>): (go.Error);
    /**
        Deprecated: PostQueuedCompletionStatus has the wrong function signature. Use x/sys/windows.PostQueuedCompletionStatus.
    **/
    @:native("PostQueuedCompletionStatus") static function postQueuedCompletionStatus(cphandle: go.syscall.Handle, qty: go.UInt32, key: go.UInt32, overlapped: go.Pointer<go.syscall.Overlapped>): (go.Error);
    @:native("Process32First") static function process32First(snapshot: go.syscall.Handle, procEntry: go.Pointer<go.syscall.ProcessEntry32>): (go.Error);
    @:native("Process32Next") static function process32Next(snapshot: go.syscall.Handle, procEntry: go.Pointer<go.syscall.ProcessEntry32>): (go.Error);
    @:native("Read") static function read(fd: go.syscall.Handle, p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("ReadConsole") static function readConsole(console: go.syscall.Handle, buf: go.Pointer<go.UInt16>, toread: go.UInt32, read: go.Pointer<go.UInt32>, inputControl: go.Pointer<go.Byte>): (go.Error);
    @:native("ReadDirectoryChanges") static function readDirectoryChanges(handle: go.syscall.Handle, buf: go.Pointer<go.Byte>, buflen: go.UInt32, watchSubTree: Bool, mask: go.UInt32, retlen: go.Pointer<go.UInt32>, overlapped: go.Pointer<go.syscall.Overlapped>, completionRoutine: go.UIntPtr): (go.Error);
    @:native("ReadFile") static function readFile(fd: go.syscall.Handle, p: go.Slice<go.Byte>, done: go.Pointer<go.UInt32>, overlapped: go.Pointer<go.syscall.Overlapped>): (go.Error);
    /**
        Readlink returns the destination of the named symbolic link.
    **/
    @:native("Readlink") static function readlink(path: String, buf: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:go.Tuple("n", "_from", "err") @:native("Recvfrom") static function recvfrom(fd: go.syscall.Handle, p: go.Slice<go.Byte>, flags: go.GoInt): (go.Tuple<{ n: go.GoInt, _from: go.syscall.Sockaddr, err: go.Error }>);
    @:native("RegCloseKey") static function regCloseKey(key: go.syscall.Handle): (go.Error);
    /**
        RegEnumKeyEx enumerates the subkeys of an open registry key.
        Each call retrieves information about one subkey. name is
        a buffer that should be large enough to hold the name of the
        subkey plus a null terminating character. nameLen is its
        length. On return, nameLen will contain the actual length of the
        subkey.
        
        Should name not be large enough to hold the subkey, this function
        will return ERROR_MORE_DATA, and must be called again with an
        appropriately sized buffer.
        
        reserved must be nil. class and classLen behave like name and nameLen
        but for the class of the subkey, except that they are optional.
        lastWriteTime, if not nil, will be populated with the time the subkey
        was last written.
        
        The caller must enumerate all subkeys in order. That is
        RegEnumKeyEx must be called with index starting at 0, incrementing
        the index until the function returns ERROR_NO_MORE_ITEMS, or with
        the index of the last subkey (obtainable from RegQueryInfoKey),
        decrementing until index 0 is enumerated.
        
        Successive calls to this API must happen on the same OS thread,
        so call [runtime.LockOSThread] before calling this function.
    **/
    @:native("RegEnumKeyEx") static function regEnumKeyEx(key: go.syscall.Handle, index: go.UInt32, name: go.Pointer<go.UInt16>, nameLen: go.Pointer<go.UInt32>, reserved: go.Pointer<go.UInt32>, _class: go.Pointer<go.UInt16>, classLen: go.Pointer<go.UInt32>, lastWriteTime: go.Pointer<go.syscall.Filetime>): (go.Error);
    @:native("RegOpenKeyEx") static function regOpenKeyEx(key: go.syscall.Handle, subkey: go.Pointer<go.UInt16>, options: go.UInt32, desiredAccess: go.UInt32, result: go.Pointer<go.syscall.Handle>): (go.Error);
    @:native("RegQueryInfoKey") static function regQueryInfoKey(key: go.syscall.Handle, _class: go.Pointer<go.UInt16>, classLen: go.Pointer<go.UInt32>, reserved: go.Pointer<go.UInt32>, subkeysLen: go.Pointer<go.UInt32>, maxSubkeyLen: go.Pointer<go.UInt32>, maxClassLen: go.Pointer<go.UInt32>, valuesLen: go.Pointer<go.UInt32>, maxValueNameLen: go.Pointer<go.UInt32>, maxValueLen: go.Pointer<go.UInt32>, saLen: go.Pointer<go.UInt32>, lastWriteTime: go.Pointer<go.syscall.Filetime>): (go.Error);
    @:native("RegQueryValueEx") static function regQueryValueEx(key: go.syscall.Handle, name: go.Pointer<go.UInt16>, reserved: go.Pointer<go.UInt32>, valtype: go.Pointer<go.UInt32>, buf: go.Pointer<go.Byte>, buflen: go.Pointer<go.UInt32>): (go.Error);
    @:native("RemoveDirectory") static function removeDirectory(path: go.Pointer<go.UInt16>): (go.Error);
    @:native("Rename") static function rename(oldpath: String, newpath: String): (go.Error);
    @:native("Rmdir") static function rmdir(path: String): (go.Error);
    @:native("Seek") static function seek(fd: go.syscall.Handle, offset: go.Int64, whence: go.GoInt): (go.Result<go.Int64>);
    @:native("Sendto") static function sendto(fd: go.syscall.Handle, p: go.Slice<go.Byte>, flags: go.GoInt, _to: go.syscall.Sockaddr): (go.Error);
    @:native("SetCurrentDirectory") static function setCurrentDirectory(path: go.Pointer<go.UInt16>): (go.Error);
    @:native("SetEndOfFile") static function setEndOfFile(handle: go.syscall.Handle): (go.Error);
    @:native("SetEnvironmentVariable") static function setEnvironmentVariable(name: go.Pointer<go.UInt16>, value: go.Pointer<go.UInt16>): (go.Error);
    @:native("SetFileAttributes") static function setFileAttributes(name: go.Pointer<go.UInt16>, attrs: go.UInt32): (go.Error);
    @:native("SetFileCompletionNotificationModes") static function setFileCompletionNotificationModes(handle: go.syscall.Handle, flags: go.UInt8): (go.Error);
    @:native("SetFilePointer") static function setFilePointer(handle: go.syscall.Handle, lowoffset: go.Int32, highoffsetptr: go.Pointer<go.Int32>, whence: go.UInt32): (go.Result<go.UInt32>);
    @:native("SetFileTime") static function setFileTime(handle: go.syscall.Handle, ctime: go.Pointer<go.syscall.Filetime>, atime: go.Pointer<go.syscall.Filetime>, wtime: go.Pointer<go.syscall.Filetime>): (go.Error);
    @:native("SetHandleInformation") static function setHandleInformation(handle: go.syscall.Handle, mask: go.UInt32, flags: go.UInt32): (go.Error);
    @:native("SetNonblock") static function setNonblock(fd: go.syscall.Handle, nonblocking: Bool): (go.Error);
    @:native("Setenv") static function setenv(key: String, value: String): (go.Error);
    @:native("Setsockopt") static function setsockopt(s: go.syscall.Handle, level: go.Int32, optname: go.Int32, optval: go.Pointer<go.Byte>, optlen: go.Int32): (go.Error);
    @:native("SetsockoptIPMreq") static function setsockoptIPMreq(fd: go.syscall.Handle, level: go.GoInt, opt: go.GoInt, mreq: go.Pointer<go.syscall.IPMreq>): (go.Error);
    @:native("SetsockoptIPv6Mreq") static function setsockoptIPv6Mreq(fd: go.syscall.Handle, level: go.GoInt, opt: go.GoInt, mreq: go.Pointer<go.syscall.IPv6Mreq>): (go.Error);
    @:native("SetsockoptInet4Addr") static function setsockoptInet4Addr(fd: go.syscall.Handle, level: go.GoInt, opt: go.GoInt, value: go.GoArray<go.Byte, 4>): (go.Error);
    @:native("SetsockoptInt") static function setsockoptInt(fd: go.syscall.Handle, level: go.GoInt, opt: go.GoInt, value: go.GoInt): (go.Error);
    @:native("SetsockoptLinger") static function setsockoptLinger(fd: go.syscall.Handle, level: go.GoInt, opt: go.GoInt, l: go.Pointer<go.syscall.Linger>): (go.Error);
    @:native("SetsockoptTimeval") static function setsockoptTimeval(fd: go.syscall.Handle, level: go.GoInt, opt: go.GoInt, tv: go.Pointer<go.syscall.Timeval>): (go.Error);
    @:native("Shutdown") static function shutdown(fd: go.syscall.Handle, how: go.GoInt): (go.Error);
    @:native("Socket") static function socket(domain: go.GoInt, typ: go.GoInt, proto: go.GoInt): (go.Result<go.syscall.Handle>);
    @:go.Tuple("pid", "handle", "err") @:native("StartProcess") static function startProcess(argv0: String, argv: go.Slice<String>, attr: go.Pointer<go.syscall.ProcAttr>): (go.Tuple<{ pid: go.GoInt, handle: go.UIntPtr, err: go.Error }>);
    /**
        StringBytePtr returns a pointer to a NUL-terminated array of bytes.
        If s contains a NUL byte this function panics instead of returning
        an error.
        
        Deprecated: Use [BytePtrFromString] instead.
    **/
    @:native("StringBytePtr") static function stringBytePtr(s: String): (go.Pointer<go.Byte>);
    /**
        StringByteSlice converts a string to a NUL-terminated []byte,
        If s contains a NUL byte this function panics instead of
        returning an error.
        
        Deprecated: Use ByteSliceFromString instead.
    **/
    @:native("StringByteSlice") static function stringByteSlice(s: String): (go.Slice<go.Byte>);
    /**
        StringToSid converts a string-format security identifier
        sid into a valid, functional sid.
    **/
    @:native("StringToSid") static function stringToSid(s: String): (go.Result<go.Pointer<go.syscall.SID>>);
    /**
        StringToUTF16 returns the UTF-16 encoding of the UTF-8 string s,
        with a terminating NUL added. If s contains a NUL byte this
        function panics instead of returning an error.
        
        Deprecated: Use [UTF16FromString] instead.
    **/
    @:native("StringToUTF16") static function stringToUTF16(s: String): (go.Slice<go.UInt16>);
    /**
        StringToUTF16Ptr returns pointer to the UTF-16 encoding of
        the UTF-8 string s, with a terminating NUL added. If s
        contains a NUL byte this function panics instead of
        returning an error.
        
        Deprecated: Use [UTF16PtrFromString] instead.
    **/
    @:native("StringToUTF16Ptr") static function stringToUTF16Ptr(s: String): (go.Pointer<go.UInt16>);
    @:native("Symlink") static function symlink(path: String, link: String): (go.Error);
    /**
        Deprecated: Use [SyscallN] instead.
    **/
    @:go.Tuple("r1", "r2", "err") @:native("Syscall") static function syscall(trap: go.UIntPtr, nargs: go.UIntPtr, a1: go.UIntPtr, a2: go.UIntPtr, a3: go.UIntPtr): (go.Tuple<{ r1: go.UIntPtr, r2: go.UIntPtr, err: go.syscall.Errno }>);
    /**
        Deprecated: Use [SyscallN] instead.
    **/
    @:go.Tuple("r1", "r2", "err") @:native("Syscall12") static function syscall12(trap: go.UIntPtr, nargs: go.UIntPtr, a1: go.UIntPtr, a2: go.UIntPtr, a3: go.UIntPtr, a4: go.UIntPtr, a5: go.UIntPtr, a6: go.UIntPtr, a7: go.UIntPtr, a8: go.UIntPtr, a9: go.UIntPtr, a10: go.UIntPtr, a11: go.UIntPtr, a12: go.UIntPtr): (go.Tuple<{ r1: go.UIntPtr, r2: go.UIntPtr, err: go.syscall.Errno }>);
    /**
        Deprecated: Use [SyscallN] instead.
    **/
    @:go.Tuple("r1", "r2", "err") @:native("Syscall15") static function syscall15(trap: go.UIntPtr, nargs: go.UIntPtr, a1: go.UIntPtr, a2: go.UIntPtr, a3: go.UIntPtr, a4: go.UIntPtr, a5: go.UIntPtr, a6: go.UIntPtr, a7: go.UIntPtr, a8: go.UIntPtr, a9: go.UIntPtr, a10: go.UIntPtr, a11: go.UIntPtr, a12: go.UIntPtr, a13: go.UIntPtr, a14: go.UIntPtr, a15: go.UIntPtr): (go.Tuple<{ r1: go.UIntPtr, r2: go.UIntPtr, err: go.syscall.Errno }>);
    /**
        Deprecated: Use [SyscallN] instead.
    **/
    @:go.Tuple("r1", "r2", "err") @:native("Syscall18") static function syscall18(trap: go.UIntPtr, nargs: go.UIntPtr, a1: go.UIntPtr, a2: go.UIntPtr, a3: go.UIntPtr, a4: go.UIntPtr, a5: go.UIntPtr, a6: go.UIntPtr, a7: go.UIntPtr, a8: go.UIntPtr, a9: go.UIntPtr, a10: go.UIntPtr, a11: go.UIntPtr, a12: go.UIntPtr, a13: go.UIntPtr, a14: go.UIntPtr, a15: go.UIntPtr, a16: go.UIntPtr, a17: go.UIntPtr, a18: go.UIntPtr): (go.Tuple<{ r1: go.UIntPtr, r2: go.UIntPtr, err: go.syscall.Errno }>);
    /**
        Deprecated: Use [SyscallN] instead.
    **/
    @:go.Tuple("r1", "r2", "err") @:native("Syscall6") static function syscall6(trap: go.UIntPtr, nargs: go.UIntPtr, a1: go.UIntPtr, a2: go.UIntPtr, a3: go.UIntPtr, a4: go.UIntPtr, a5: go.UIntPtr, a6: go.UIntPtr): (go.Tuple<{ r1: go.UIntPtr, r2: go.UIntPtr, err: go.syscall.Errno }>);
    /**
        Deprecated: Use [SyscallN] instead.
    **/
    @:go.Tuple("r1", "r2", "err") @:native("Syscall9") static function syscall9(trap: go.UIntPtr, nargs: go.UIntPtr, a1: go.UIntPtr, a2: go.UIntPtr, a3: go.UIntPtr, a4: go.UIntPtr, a5: go.UIntPtr, a6: go.UIntPtr, a7: go.UIntPtr, a8: go.UIntPtr, a9: go.UIntPtr): (go.Tuple<{ r1: go.UIntPtr, r2: go.UIntPtr, err: go.syscall.Errno }>);
    /**
        SyscallN executes procedure p with arguments args.
        
        See [Proc.Call] for more information.
    **/
    @:go.Tuple("r1", "r2", "err") @:native("SyscallN") static function syscallN(p: go.UIntPtr, args: haxe.Rest<go.UIntPtr>): (go.Tuple<{ r1: go.UIntPtr, r2: go.UIntPtr, err: go.syscall.Errno }>);
    @:native("TerminateProcess") static function terminateProcess(handle: go.syscall.Handle, exitcode: go.UInt32): (go.Error);
    @:native("TimespecToNsec") static function timespecToNsec(ts: go.syscall.Timespec): (go.Int64);
    /**
        TranslateAccountName converts a directory service
        object name from one format to another.
    **/
    @:native("TranslateAccountName") static function translateAccountName(username: String, _from: go.UInt32, _to: go.UInt32, initSize: go.GoInt): (go.Result<String>);
    @:native("TranslateName") static function translateName(accName: go.Pointer<go.UInt16>, accNameFormat: go.UInt32, desiredNameFormat: go.UInt32, translatedName: go.Pointer<go.UInt16>, nSize: go.Pointer<go.UInt32>): (go.Error);
    @:native("TransmitFile") static function transmitFile(s: go.syscall.Handle, handle: go.syscall.Handle, bytesToWrite: go.UInt32, bytsPerSend: go.UInt32, overlapped: go.Pointer<go.syscall.Overlapped>, transmitFileBuf: go.Pointer<go.syscall.TransmitFileBuffers>, flags: go.UInt32): (go.Error);
    /**
        UTF16FromString returns the UTF-16 encoding of the UTF-8 string
        s, with a terminating NUL added. If s contains a NUL byte at any
        location, it returns (nil, [EINVAL]). Unpaired surrogates
        are encoded using WTF-8.
    **/
    @:native("UTF16FromString") static function uTF16FromString(s: String): (go.Result<go.Slice<go.UInt16>>);
    /**
        UTF16PtrFromString returns pointer to the UTF-16 encoding of
        the UTF-8 string s, with a terminating NUL added. If s
        contains a NUL byte at any location, it returns (nil, EINVAL).
        Unpaired surrogates are encoded using WTF-8.
    **/
    @:native("UTF16PtrFromString") static function uTF16PtrFromString(s: String): (go.Result<go.Pointer<go.UInt16>>);
    /**
        UTF16ToString returns the UTF-8 encoding of the UTF-16 sequence s,
        with a terminating NUL removed. Unpaired surrogates are decoded
        using WTF-8 instead of UTF-8 encoding.
    **/
    @:native("UTF16ToString") static function uTF16ToString(s: go.Slice<go.UInt16>): (String);
    @:native("Unlink") static function unlink(path: String): (go.Error);
    @:native("UnmapViewOfFile") static function unmapViewOfFile(addr: go.UIntPtr): (go.Error);
    @:native("Unsetenv") static function unsetenv(key: String): (go.Error);
    @:native("Utimes") static function utimes(path: String, tv: go.Slice<go.syscall.Timeval>): (go.Error);
    @:native("UtimesNano") static function utimesNano(path: String, ts: go.Slice<go.syscall.Timespec>): (go.Error);
    @:native("VirtualLock") static function virtualLock(addr: go.UIntPtr, length: go.UIntPtr): (go.Error);
    @:native("VirtualUnlock") static function virtualUnlock(addr: go.UIntPtr, length: go.UIntPtr): (go.Error);
    @:native("WSACleanup") static function wSACleanup(): (go.Error);
    @:native("WSAEnumProtocols") static function wSAEnumProtocols(protocols: go.Pointer<go.Int32>, protocolBuffer: go.Pointer<go.syscall.WSAProtocolInfo>, bufferLength: go.Pointer<go.UInt32>): (go.Result<go.Int32>);
    @:native("WSAIoctl") static function wSAIoctl(s: go.syscall.Handle, iocc: go.UInt32, inbuf: go.Pointer<go.Byte>, cbif: go.UInt32, outbuf: go.Pointer<go.Byte>, cbob: go.UInt32, cbbr: go.Pointer<go.UInt32>, overlapped: go.Pointer<go.syscall.Overlapped>, completionRoutine: go.UIntPtr): (go.Error);
    @:native("WSARecv") static function wSARecv(s: go.syscall.Handle, bufs: go.Pointer<go.syscall.WSABuf>, bufcnt: go.UInt32, recvd: go.Pointer<go.UInt32>, flags: go.Pointer<go.UInt32>, overlapped: go.Pointer<go.syscall.Overlapped>, croutine: go.Pointer<go.Byte>): (go.Error);
    @:native("WSARecvFrom") static function wSARecvFrom(s: go.syscall.Handle, bufs: go.Pointer<go.syscall.WSABuf>, bufcnt: go.UInt32, recvd: go.Pointer<go.UInt32>, flags: go.Pointer<go.UInt32>, _from: go.Pointer<go.syscall.RawSockaddrAny>, fromlen: go.Pointer<go.Int32>, overlapped: go.Pointer<go.syscall.Overlapped>, croutine: go.Pointer<go.Byte>): (go.Error);
    @:native("WSASend") static function wSASend(s: go.syscall.Handle, bufs: go.Pointer<go.syscall.WSABuf>, bufcnt: go.UInt32, sent: go.Pointer<go.UInt32>, flags: go.UInt32, overlapped: go.Pointer<go.syscall.Overlapped>, croutine: go.Pointer<go.Byte>): (go.Error);
    @:native("WSASendTo") static function wSASendTo(s: go.syscall.Handle, bufs: go.Pointer<go.syscall.WSABuf>, bufcnt: go.UInt32, sent: go.Pointer<go.UInt32>, flags: go.UInt32, _to: go.Pointer<go.syscall.RawSockaddrAny>, tolen: go.Int32, overlapped: go.Pointer<go.syscall.Overlapped>, croutine: go.Pointer<go.Byte>): (go.Error);
    @:native("WSASendto") static function wSASendto(s: go.syscall.Handle, bufs: go.Pointer<go.syscall.WSABuf>, bufcnt: go.UInt32, sent: go.Pointer<go.UInt32>, flags: go.UInt32, _to: go.syscall.Sockaddr, overlapped: go.Pointer<go.syscall.Overlapped>, croutine: go.Pointer<go.Byte>): (go.Error);
    @:native("WSAStartup") static function wSAStartup(verreq: go.UInt32, data: go.Pointer<go.syscall.WSAData>): (go.Error);
    @:native("WaitForSingleObject") static function waitForSingleObject(handle: go.syscall.Handle, waitMilliseconds: go.UInt32): (go.Result<go.UInt32>);
    @:native("Write") static function write(fd: go.syscall.Handle, p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("WriteConsole") static function writeConsole(console: go.syscall.Handle, buf: go.Pointer<go.UInt16>, towrite: go.UInt32, written: go.Pointer<go.UInt32>, reserved: go.Pointer<go.Byte>): (go.Error);
    @:native("WriteFile") static function writeFile(fd: go.syscall.Handle, p: go.Slice<go.Byte>, done: go.Pointer<go.UInt32>, overlapped: go.Pointer<go.syscall.Overlapped>): (go.Error);

}