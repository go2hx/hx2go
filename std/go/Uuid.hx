package go;

/**
    Package uuid provides support for generating and manipulating UUIDs.
    
    See [RFC 9562] for details.
    
    Random components of new UUIDs are generated with a
    cryptographically secure random number generator.
    
    UUIDs may be generated using various algorithms.
    The [New] function returns a new UUID generated using
    an algorithm suitable for most purposes.
    
    [RFC 9562]: https://www.rfc-editor.org/rfc/rfc9562.html
**/
@:go.Type({ name: "uuid", instanceName: "uuid.uuid", imports: ["uuid"] })
extern class Uuid {

    /**
        Max returns the Max UUID ffffffff-ffff-ffff-ffff-ffffffffffff.
        
        The Max UUID is defined in [Section 5.10 of RFC 9562].
        
        [Section 5.10 of RFC 9562]: https://www.rfc-editor.org/rfc/rfc9562#section-5.10
    **/
    @:native("Max") static function max(): (go.uuid.UUID);
    /**
        MustParse returns the UUID represented by s.
        
        It panics if s is not a valid string representation of a UUID as defined by [Parse].
    **/
    @:native("MustParse") static function mustParse(s: String): (go.uuid.UUID);
    /**
        New returns a new UUID.
        
        Programs which do not have a need for a specific UUID generation algorithm should use New.
        At this time, New is equivalent to [NewV4].
    **/
    @:native("New") static function _new(): (go.uuid.UUID);
    /**
        NewV4 returns a new version 4 UUID.
        
        Version 4 UUIDs contain 122 bits of random data.
    **/
    @:native("NewV4") static function newV4(): (go.uuid.UUID);
    /**
        NewV7 returns a new version 7 UUID.
        
        Version 7 UUIDs contain a timestamp in the most significant 48 bits,
        and at least 62 bits of random data.
        
        NewV7 always returns UUIDs which sort in increasing order,
        except when the system clock moves backwards.
    **/
    @:native("NewV7") static function newV7(): (go.uuid.UUID);
    /**
        Nil returns the Nil UUID 00000000-0000-0000-0000-000000000000.
        
        The Nil UUID is defined in [Section 5.9 of RFC 9562].
        Note that this is not the same as the Go value nil.
        
        [Section 5.9 of RFC 9562]: https://www.rfc-editor.org/rfc/rfc9562#section-5.9
    **/
    @:native("Nil") static function nil(): (go.uuid.UUID);
    /**
        Parse returns the UUID represented by s.
        
        It accepts strings in the following forms:
        
        	f81d4fae-7dec-11d0-a765-00a0c91e6bf6
        	{f81d4fae-7dec-11d0-a765-00a0c91e6bf6}
        	urn:uuid:f81d4fae-7dec-11d0-a765-00a0c91e6bf6
        	f81d4fae7dec11d0a76500a0c91e6bf6
        
        Alphabetic characters in the hexadecimal digits may be any case.
    **/
    @:native("Parse") static function parse(s: String): (go.Result<go.uuid.UUID>);

}