package go.go.scanner;

/**
    ErrorList is a list of *Errors.
    The zero value for an ErrorList is an empty ErrorList ready to use.
**/
@:go.Type({ name: "ErrorList", instanceName: "scanner.ErrorList", imports: ["go/scanner"] })
extern class ErrorList {

    /**
        Add adds an [Error] with given position and error message to an [ErrorList].
    **/
    @:native("Add") function add(pos: go.go.token.Position, msg: String): Void;
    /**
        Err returns an error equivalent to this error list.
        If the list is empty, Err returns nil.
    **/
    @:native("Err") function err(): (go.Error);
    /**
        An [ErrorList] implements the error interface.
    **/
    @:native("Error") function error(): (String);
    /**
        [ErrorList] implements the sort Interface.
    **/
    @:native("Len") function len(): (go.GoInt);
    @:native("Less") function less(i: go.GoInt, j: go.GoInt): (Bool);
    /**
        RemoveMultiples sorts an [ErrorList] and removes all but the first error per line.
    **/
    @:native("RemoveMultiples") function removeMultiples(): Void;
    /**
        Reset resets an [ErrorList] to no errors.
    **/
    @:native("Reset") function reset(): Void;
    /**
        Sort sorts an [ErrorList]. *[Error] entries are sorted by position,
        other errors are sorted by error message, and before any *[Error]
        entry.
    **/
    @:native("Sort") function sort(): Void;
    @:native("Swap") function swap(i: go.GoInt, j: go.GoInt): Void;

}