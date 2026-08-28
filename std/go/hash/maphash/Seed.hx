package go.hash.maphash;

/**
    A Seed is a random value that selects the specific hash function
    computed by a [Hash]. If two Hashes use the same Seeds, they
    will compute the same hash values for any given input.
    If two Hashes use different Seeds, they are very likely to compute
    distinct hash values for any given input.
    
    A Seed must be initialized by calling [MakeSeed].
    The zero seed is uninitialized and not valid for use with [Hash]'s SetSeed method.
    
    Each Seed value is local to a single process and cannot be serialized
    or otherwise recreated in a different process.
**/
@:structInit
@:go.Type({ name: "Seed", instanceName: "maphash.Seed", imports: ["hash/maphash"] })
extern class Seed {

}