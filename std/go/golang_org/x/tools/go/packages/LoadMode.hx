package go.golang_org.x.tools.go.packages;

/**
    A LoadMode controls the amount of detail to return when loading.
    The bits below can be combined to specify which fields should be
    filled in the result packages.
    
    The zero value is a special case, equivalent to combining
    the NeedName, NeedFiles, and NeedCompiledGoFiles bits.
    
    ID and Errors (if present) will always be filled.
    [Load] may return more information than requested.
    
    The Mode flag is a union of several bits named NeedName,
    NeedFiles, and so on, each of which determines whether
    a given field of Package (Name, Files, etc) should be
    populated.
    
    For convenience, we provide named constants for the most
    common combinations of Need flags:
    
    	[LoadFiles]     lists of files in each package
    	[LoadImports]   ... plus imports
    	[LoadTypes]     ... plus type information
    	[LoadSyntax]    ... plus type-annotated syntax
    	[LoadAllSyntax] ... for all dependencies
    
    Unfortunately there are a number of open bugs related to
    interactions among the LoadMode bits:
      - https://go.dev/issue/56633
      - https://go.dev/issue/56677
      - https://go.dev/issue/58726
      - https://go.dev/issue/63517
**/
@:go.Type({ name: "LoadMode", instanceName: "packages.LoadMode", imports: ["golang.org/x/tools/go/packages"] })
extern typedef LoadMode = haxe.extern.EitherType<go.GoInt, {
    @:native("String") function string(): (String);

}>