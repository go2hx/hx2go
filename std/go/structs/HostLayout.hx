package go.structs;

/**
    HostLayout marks a struct as using host memory layout. A struct with a
    field of type HostLayout will be laid out in memory according to host
    expectations, generally following the host's C ABI.
    
    HostLayout does not affect layout within any other struct-typed fields
    of the containing struct, nor does it affect layout of structs
    containing the struct marked as host layout.
    
    By convention, HostLayout should be used as the type of a field
    named "_", placed at the beginning of the struct type definition.
**/
@:structInit
@:go.Type({ name: "HostLayout", instanceName: "structs.HostLayout", imports: ["structs"] })
extern class HostLayout {

}