package go.debug;

/**
    Package plan9obj implements access to Plan 9 a.out object files.
    
    # Security
    
    This package is not designed to be hardened against adversarial inputs, and is
    outside the scope of https://go.dev/security/policy. In particular, only basic
    validation is done when parsing object files. As such, care should be taken when
    parsing untrusted inputs, as parsing malformed files may consume significant
    resources, or cause panics.
**/
@:go.Type({ name: "plan9obj", instanceName: "plan9obj.plan9obj", imports: ["debug/plan9obj"] })
extern class Plan9obj {

    @:native("Magic386") static var magic386: go.GoInt;
    @:native("Magic64") static var magic64: go.GoInt;
    @:native("MagicAMD64") static var magicAMD64: go.GoInt;
    @:native("MagicARM") static var magicARM: go.GoInt;

    /**
        NewFile creates a new [File] for accessing a Plan 9 binary in an underlying reader.
        The Plan 9 binary is expected to start at position 0 in the ReaderAt.
    **/
    @:native("NewFile") static function newFile(r: go.io.ReaderAt): (go.Result<go.Pointer<go.debug.plan9obj.File>>);
    /**
        Open opens the named file using [os.Open] and prepares it for use as a Plan 9 a.out binary.
    **/
    @:native("Open") static function open(name: String): (go.Result<go.Pointer<go.debug.plan9obj.File>>);

}