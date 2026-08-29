package go.go.scanner;

/**
    An ErrorHandler may be provided to [Scanner.Init]. If a syntax error is
    encountered and a handler was installed, the handler is called with a
    position and an error message. The position points to the beginning of
    the offending token.
**/
@:go.Type({ name: "ErrorHandler", instanceName: "scanner.ErrorHandler", imports: ["go/scanner"] })
extern class ErrorHandler {

}