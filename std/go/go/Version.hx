package go.go;

/**
    Package version provides operations on [Go versions]
    in [Go toolchain name syntax]: strings like
    "go1.20", "go1.21.0", "go1.22rc2", and "go1.23.4-custom".
    
    [Go versions]: https://go.dev/doc/toolchain#version
    [Go toolchain name syntax]: https://go.dev/doc/toolchain#name
**/
@:go.Type({ name: "version", instanceName: "version.version", imports: ["go/version"] })
extern class Version {

    /**
        Compare returns -1, 0, or +1 depending on whether
        x < y, x == y, or x > y, interpreted as Go versions.
        The versions x and y must begin with a "go" prefix: "go1.21" not "1.21".
        Invalid versions, including the empty string, compare less than
        valid versions and equal to each other.
        The language version "go1.21" compares less than the
        release candidate and eventual releases "go1.21rc1" and "go1.21.0".
    **/
    @:native("Compare") static function compare(x: String, y: String): (go.GoInt);
    /**
        IsValid reports whether the version x is valid.
    **/
    @:native("IsValid") static function isValid(x: String): (Bool);
    /**
        Lang returns the Go language version for version x.
        If x is not a valid version, Lang returns the empty string.
        For example:
        
        	Lang("go1.21rc2") = "go1.21"
        	Lang("go1.21.2") = "go1.21"
        	Lang("go1.21") = "go1.21"
        	Lang("go1") = "go1"
        	Lang("bad") = ""
        	Lang("1.21") = ""
    **/
    @:native("Lang") static function lang(x: String): (String);

}