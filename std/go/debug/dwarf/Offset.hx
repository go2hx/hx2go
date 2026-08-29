package go.debug.dwarf;

/**
    An Offset represents the location of an [Entry] within the DWARF info.
    (See [Reader.Seek].)
**/
@:go.Type({ name: "Offset", instanceName: "dwarf.Offset", imports: ["debug/dwarf"] })
extern typedef Offset = go.UInt32