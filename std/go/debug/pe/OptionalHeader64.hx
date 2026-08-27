package go.debug.pe;

@:structInit
@:go.Type({ name: "OptionalHeader64", instanceName: "pe.OptionalHeader64", imports: ["debug/pe"] })
extern class OptionalHeader64 {

    @:native("Magic") var magic: go.UInt16;
    @:native("MajorLinkerVersion") var majorLinkerVersion: go.UInt8;
    @:native("MinorLinkerVersion") var minorLinkerVersion: go.UInt8;
    @:native("SizeOfCode") var sizeOfCode: go.UInt32;
    @:native("SizeOfInitializedData") var sizeOfInitializedData: go.UInt32;
    @:native("SizeOfUninitializedData") var sizeOfUninitializedData: go.UInt32;
    @:native("AddressOfEntryPoint") var addressOfEntryPoint: go.UInt32;
    @:native("BaseOfCode") var baseOfCode: go.UInt32;
    @:native("ImageBase") var imageBase: go.UInt64;
    @:native("SectionAlignment") var sectionAlignment: go.UInt32;
    @:native("FileAlignment") var fileAlignment: go.UInt32;
    @:native("MajorOperatingSystemVersion") var majorOperatingSystemVersion: go.UInt16;
    @:native("MinorOperatingSystemVersion") var minorOperatingSystemVersion: go.UInt16;
    @:native("MajorImageVersion") var majorImageVersion: go.UInt16;
    @:native("MinorImageVersion") var minorImageVersion: go.UInt16;
    @:native("MajorSubsystemVersion") var majorSubsystemVersion: go.UInt16;
    @:native("MinorSubsystemVersion") var minorSubsystemVersion: go.UInt16;
    @:native("Win32VersionValue") var win32VersionValue: go.UInt32;
    @:native("SizeOfImage") var sizeOfImage: go.UInt32;
    @:native("SizeOfHeaders") var sizeOfHeaders: go.UInt32;
    @:native("CheckSum") var checkSum: go.UInt32;
    @:native("Subsystem") var subsystem: go.UInt16;
    @:native("DllCharacteristics") var dllCharacteristics: go.UInt16;
    @:native("SizeOfStackReserve") var sizeOfStackReserve: go.UInt64;
    @:native("SizeOfStackCommit") var sizeOfStackCommit: go.UInt64;
    @:native("SizeOfHeapReserve") var sizeOfHeapReserve: go.UInt64;
    @:native("SizeOfHeapCommit") var sizeOfHeapCommit: go.UInt64;
    @:native("LoaderFlags") var loaderFlags: go.UInt32;
    @:native("NumberOfRvaAndSizes") var numberOfRvaAndSizes: go.UInt32;
    @:native("DataDirectory") var dataDirectory: go.GoArray<go.debug.pe.DataDirectory, 16>;

    function new(magic: go.UInt16=0, majorLinkerVersion: go.UInt8=0, minorLinkerVersion: go.UInt8=0, sizeOfCode: go.UInt32=0, sizeOfInitializedData: go.UInt32=0, sizeOfUninitializedData: go.UInt32=0, addressOfEntryPoint: go.UInt32=0, baseOfCode: go.UInt32=0, imageBase: go.UInt64=0, sectionAlignment: go.UInt32=0, fileAlignment: go.UInt32=0, majorOperatingSystemVersion: go.UInt16=0, minorOperatingSystemVersion: go.UInt16=0, majorImageVersion: go.UInt16=0, minorImageVersion: go.UInt16=0, majorSubsystemVersion: go.UInt16=0, minorSubsystemVersion: go.UInt16=0, win32VersionValue: go.UInt32=0, sizeOfImage: go.UInt32=0, sizeOfHeaders: go.UInt32=0, checkSum: go.UInt32=0, subsystem: go.UInt16=0, dllCharacteristics: go.UInt16=0, sizeOfStackReserve: go.UInt64=0, sizeOfStackCommit: go.UInt64=0, sizeOfHeapReserve: go.UInt64=0, sizeOfHeapCommit: go.UInt64=0, loaderFlags: go.UInt32=0, numberOfRvaAndSizes: go.UInt32=0, dataDirectory: go.GoArray<go.debug.pe.DataDirectory, 16>);

}