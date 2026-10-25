package go.syscall;

/**
    The security identifier (SID) structure is a variable-length
    structure used to uniquely identify users or groups.
**/
@:structInit
@:go.Type({ name: "SID", instanceName: "syscall.SID", imports: ["syscall"] })
extern class SID {

    /**
        Copy creates a duplicate of security identifier sid.
    **/
    @:native("Copy") function copy(): (go.Result<go.Pointer<go.syscall.SID>>);
    /**
        Len returns the length, in bytes, of a valid security identifier sid.
    **/
    @:native("Len") function len(): (go.GoInt);
    /**
        LookupAccount retrieves the name of the account for this sid
        and the name of the first domain on which this sid is found.
        System specify target computer to search for.
    **/
    @:go.Tuple("account", "domain", "accType", "err") @:native("LookupAccount") function lookupAccount(system: String): (go.Tuple<{ account: String, domain: String, accType: go.UInt32, err: go.Error }>);
    /**
        String converts sid to a string format
        suitable for display, storage, or transmission.
    **/
    @:native("String") function string(): (go.Result<String>);

}