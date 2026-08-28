package go.runtime;

/**
    A Pinner is a set of Go objects each pinned to a fixed location in memory. The
    [Pinner.Pin] method pins one object, while [Pinner.Unpin] unpins all pinned
    objects.
    
    The purpose of a Pinner is two-fold.
    First, it allows C code to safely use Go pointers that have not been passed
    explicitly to the C code via a cgo call.
    For example, for safely interacting with a pointer stored inside of a struct
    whose pointer is passed to a C function.
    Second, it allows C memory to safely retain that Go pointer even after the
    cgo call returns, provided the object remains pinned.
    
    A Pinner arranges for its objects to be automatically unpinned some time after
    it becomes unreachable, so its referents will not leak. However, this means the
    Pinner itself must be kept alive across a cgo call, or as long as C retains a
    reference to the pinned Go pointers.
    
    Reusing a Pinner is safe, and in fact encouraged, to avoid the cost of
    initializing new Pinners on first use.
    
    The zero value of Pinner is ready to use.
**/
@:structInit
@:go.Type({ name: "Pinner", instanceName: "runtime.Pinner", imports: ["runtime"] })
extern class Pinner {

    /**
        Pin pins a Go object, preventing it from being moved or freed by the garbage
        collector until the [Pinner.Unpin] method has been called.
        
        A pointer to a pinned object can be directly stored in C memory or can be
        contained in Go memory passed to C functions. If the pinned object itself
        contains pointers to Go objects, these objects must be pinned separately if they
        are going to be accessed from C code.
        
        The argument must be a pointer of any type or an [unsafe.Pointer].
        
        It's safe to call Pin on non-Go pointers, in which case Pin will do nothing.
    **/
    @:native("Pin") function pin(pointer: Dynamic): Void;
    /**
        Unpin unpins all pinned objects of the [Pinner].
        It's safe and encouraged to reuse a Pinner after calling Unpin.
    **/
    @:native("Unpin") function unpin(): Void;

}