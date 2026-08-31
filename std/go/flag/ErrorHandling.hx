package go.flag;

/**
    ErrorHandling defines how [FlagSet.Parse] behaves if the parse fails.
**/
@:go.Type({ name: "ErrorHandling", instanceName: "flag.ErrorHandling", imports: ["flag"] })
extern typedef ErrorHandling = go.GoInt