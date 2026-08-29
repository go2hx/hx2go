package go.crypto.dsa;

/**
    ParameterSizes is an enumeration of the acceptable bit lengths of the primes
    in a set of DSA parameters. See FIPS 186-3, section 4.2.
**/
@:go.Type({ name: "ParameterSizes", instanceName: "dsa.ParameterSizes", imports: ["crypto/dsa"] })
extern typedef ParameterSizes = go.GoInt