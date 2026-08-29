package go.context;

/**
    A CancelFunc tells an operation to abandon its work.
    A CancelFunc does not wait for the work to stop.
    A CancelFunc may be called by multiple goroutines simultaneously.
    After the first call, subsequent calls to a CancelFunc do nothing.
**/
@:go.Type({ name: "CancelFunc", instanceName: "context.CancelFunc", imports: ["context"] })
extern class CancelFunc {

}