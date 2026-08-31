package go.text.template;

/**
    FuncMap is the type of the map defining the mapping from names to functions.
    Each function must have either a single return value, or two return values of
    which the second has type error. In that case, if the second (error)
    return value evaluates to non-nil during execution, execution terminates and
    Execute returns that error.
    
    Errors returned by Execute wrap the underlying error; call [errors.AsType] to
    unwrap them.
    
    When template execution invokes a function with an argument list, that list
    must be assignable to the function's parameter types. Functions meant to
    apply to arguments of arbitrary type can use parameters of type interface{} or
    of type [reflect.Value]. Similarly, functions meant to return a result of arbitrary
    type can return interface{} or [reflect.Value].
**/
@:go.Type({ name: "FuncMap", instanceName: "template.FuncMap", imports: ["text/template"] })
extern class FuncMap {

}