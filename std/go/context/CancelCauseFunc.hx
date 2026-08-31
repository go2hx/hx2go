package go.context;

/**
    A CancelCauseFunc behaves like a [CancelFunc] but additionally sets the cancellation cause.
    This cause can be retrieved by calling [Cause] on the canceled Context or on
    any of its derived Contexts.
    
    If the context has already been canceled, CancelCauseFunc does not set the cause.
    For example, if childContext is derived from parentContext:
      - if parentContext is canceled with cause1 before childContext is canceled with cause2,
        then Cause(parentContext) == Cause(childContext) == cause1
      - if childContext is canceled with cause2 before parentContext is canceled with cause1,
        then Cause(parentContext) == cause1 and Cause(childContext) == cause2
**/
@:go.Type({ name: "CancelCauseFunc", instanceName: "context.CancelCauseFunc", imports: ["context"] })
extern class CancelCauseFunc {

}