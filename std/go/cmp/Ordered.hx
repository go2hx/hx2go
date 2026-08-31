package go.cmp;

/**
    Ordered is a constraint that permits any ordered type: any type
    that supports the operators < <= >= >.
    If future releases of Go add new ordered types,
    this constraint will be modified to include them.
    
    Note that floating-point types may contain NaN ("not-a-number") values.
    An operator such as == or < will always report false when
    comparing a NaN value with any other value, NaN or not.
    See the [Compare] function for a consistent way to compare NaN values.
**/
@:go.Type({ name: "Ordered", instanceName: "cmp.Ordered", imports: ["cmp"] })
extern typedef Ordered = {

}