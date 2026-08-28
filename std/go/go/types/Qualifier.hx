package go.go.types;

/**
    A Qualifier controls how named package-level objects are printed in
    calls to [TypeString], [ObjectString], and [SelectionString].
    
    These three formatting routines call the Qualifier for each
    package-level object O, and if the Qualifier returns a non-empty
    string p, the object is printed in the form p.O.
    If it returns an empty string, only the object name O is printed.
    
    Using a nil Qualifier is equivalent to using (*[Package]).Path: the
    object is qualified by the import path, e.g., "encoding/json.Marshal".
**/
@:go.Type({ name: "Qualifier", instanceName: "types.Qualifier", imports: ["go/types"] })
extern class Qualifier {

}