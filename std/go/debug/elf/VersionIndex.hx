package go.debug.elf;

/**
    VersionIndex is the type of a [Symbol] version index.
**/
@:go.Type({ name: "VersionIndex", instanceName: "elf.VersionIndex", imports: ["debug/elf"] })
extern typedef VersionIndex = haxe.extern.EitherType<go.UInt16, {
    /**
        Index returns the version index.
        If this is the value 0, it means that the symbol is local,
        and is not visible externally.
        If this is the value 1, it means that the symbol is in the base version,
        and has no specific version; it may or may not match a
        [DynamicVersion.Index] in the slice returned by [File.DynamicVersions].
        Other values will match either [DynamicVersion.Index]
        in the slice returned by [File.DynamicVersions],
        or [DynamicVersionDep.Index] in the Needs field
        of the elements of the slice returned by [File.DynamicVersionNeeds].
        In general, a defined symbol will have an index referring
        to DynamicVersions, and an undefined symbol will have an index
        referring to some version in DynamicVersionNeeds.
    **/
    @:native("Index") function index(): (go.UInt16);
    /**
        IsHidden reports whether the symbol is hidden within the version.
        This means that the symbol can only be seen by specifying the exact version.
    **/
    @:native("IsHidden") function isHidden(): (Bool);

}>