package go.syscall;

/**
    Pointer represents a pointer to an arbitrary Windows type.
    
    Pointer-typed fields may point to one of many different types. It's
    up to the caller to provide a pointer to the appropriate type, cast
    to Pointer. The caller must obey the unsafe.Pointer rules while
    doing so.
**/
@:go.Type({ name: "Pointer", instanceName: "syscall.Pointer", imports: ["syscall"] })
extern class Pointer {

}