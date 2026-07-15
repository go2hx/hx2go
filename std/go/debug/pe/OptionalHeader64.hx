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

function new(magic: go.UInt16, majorLinkerVersion: go.UInt8, minorLinkerVersion: go.UInt8, sizeOfCode: go.UInt32, sizeOfInitializedData: go.UInt32, sizeOfUninitializedData: go.UInt32, addressOfEntryPoint: go.UInt32, baseOfCode: go.UInt32, imageBase: go.UInt64, sectionAlignment: go.UInt32, fileAlignment: go.UInt32, majorOperatingSystemVersion: go.UInt16, minorOperatingSystemVersion: go.UInt16, majorImageVersion: go.UInt16, minorImageVersion: go.UInt16, majorSubsystemVersion: go.UInt16, minorSubsystemVersion: go.UInt16, win32VersionValue: go.UInt32, sizeOfImage: go.UInt32, sizeOfHeaders: go.UInt32, checkSum: go.UInt32, subsystem: go.UInt16, dllCharacteristics: go.UInt16, sizeOfStackReserve: go.UInt64, sizeOfStackCommit: go.UInt64, sizeOfHeapReserve: go.UInt64, sizeOfHeapCommit: go.UInt64, loaderFlags: go.UInt32, numberOfRvaAndSizes: go.UInt32, dataDirectory: go.GoArray<go.debug.pe.DataDirectory, 16>);

}