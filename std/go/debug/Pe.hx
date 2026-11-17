package go.debug;

/**
    Package pe implements access to PE (Microsoft Windows Portable Executable) files.
    
    # Security
    
    This package is not designed to be hardened against adversarial inputs, and is
    outside the scope of https://go.dev/security/policy. In particular, only basic
    validation is done when parsing object files. As such, care should be taken when
    parsing untrusted inputs, as parsing malformed files may consume significant
    resources, or cause panics.
**/
@:go.Type({ name: "pe", instanceName: "pe.pe", imports: ["debug/pe"] })
extern class Pe {

    @:native("COFFSymbolSize") static final cOFFSymbolSize: go.GoInt;
    /**
        These constants make up the possible values for the 'Selection'
        field in an AuxFormat5.
    **/
    @:native("IMAGE_COMDAT_SELECT_ANY") static final IMAGE_COMDAT_SELECT_ANY: go.GoInt;
    /**
        These constants make up the possible values for the 'Selection'
        field in an AuxFormat5.
    **/
    @:native("IMAGE_COMDAT_SELECT_ASSOCIATIVE") static final IMAGE_COMDAT_SELECT_ASSOCIATIVE: go.GoInt;
    /**
        These constants make up the possible values for the 'Selection'
        field in an AuxFormat5.
    **/
    @:native("IMAGE_COMDAT_SELECT_EXACT_MATCH") static final IMAGE_COMDAT_SELECT_EXACT_MATCH: go.GoInt;
    /**
        These constants make up the possible values for the 'Selection'
        field in an AuxFormat5.
    **/
    @:native("IMAGE_COMDAT_SELECT_LARGEST") static final IMAGE_COMDAT_SELECT_LARGEST: go.GoInt;
    /**
        These constants make up the possible values for the 'Selection'
        field in an AuxFormat5.
    **/
    @:native("IMAGE_COMDAT_SELECT_NODUPLICATES") static final IMAGE_COMDAT_SELECT_NODUPLICATES: go.GoInt;
    /**
        These constants make up the possible values for the 'Selection'
        field in an AuxFormat5.
    **/
    @:native("IMAGE_COMDAT_SELECT_SAME_SIZE") static final IMAGE_COMDAT_SELECT_SAME_SIZE: go.GoInt;
    /**
        IMAGE_DIRECTORY_ENTRY constants
    **/
    @:native("IMAGE_DIRECTORY_ENTRY_ARCHITECTURE") static final IMAGE_DIRECTORY_ENTRY_ARCHITECTURE: go.GoInt;
    /**
        IMAGE_DIRECTORY_ENTRY constants
    **/
    @:native("IMAGE_DIRECTORY_ENTRY_BASERELOC") static final IMAGE_DIRECTORY_ENTRY_BASERELOC: go.GoInt;
    /**
        IMAGE_DIRECTORY_ENTRY constants
    **/
    @:native("IMAGE_DIRECTORY_ENTRY_BOUND_IMPORT") static final IMAGE_DIRECTORY_ENTRY_BOUND_IMPORT: go.GoInt;
    /**
        IMAGE_DIRECTORY_ENTRY constants
    **/
    @:native("IMAGE_DIRECTORY_ENTRY_COM_DESCRIPTOR") static final IMAGE_DIRECTORY_ENTRY_COM_DESCRIPTOR: go.GoInt;
    /**
        IMAGE_DIRECTORY_ENTRY constants
    **/
    @:native("IMAGE_DIRECTORY_ENTRY_DEBUG") static final IMAGE_DIRECTORY_ENTRY_DEBUG: go.GoInt;
    /**
        IMAGE_DIRECTORY_ENTRY constants
    **/
    @:native("IMAGE_DIRECTORY_ENTRY_DELAY_IMPORT") static final IMAGE_DIRECTORY_ENTRY_DELAY_IMPORT: go.GoInt;
    /**
        IMAGE_DIRECTORY_ENTRY constants
    **/
    @:native("IMAGE_DIRECTORY_ENTRY_EXCEPTION") static final IMAGE_DIRECTORY_ENTRY_EXCEPTION: go.GoInt;
    /**
        IMAGE_DIRECTORY_ENTRY constants
    **/
    @:native("IMAGE_DIRECTORY_ENTRY_EXPORT") static final IMAGE_DIRECTORY_ENTRY_EXPORT: go.GoInt;
    /**
        IMAGE_DIRECTORY_ENTRY constants
    **/
    @:native("IMAGE_DIRECTORY_ENTRY_GLOBALPTR") static final IMAGE_DIRECTORY_ENTRY_GLOBALPTR: go.GoInt;
    /**
        IMAGE_DIRECTORY_ENTRY constants
    **/
    @:native("IMAGE_DIRECTORY_ENTRY_IAT") static final IMAGE_DIRECTORY_ENTRY_IAT: go.GoInt;
    /**
        IMAGE_DIRECTORY_ENTRY constants
    **/
    @:native("IMAGE_DIRECTORY_ENTRY_IMPORT") static final IMAGE_DIRECTORY_ENTRY_IMPORT: go.GoInt;
    /**
        IMAGE_DIRECTORY_ENTRY constants
    **/
    @:native("IMAGE_DIRECTORY_ENTRY_LOAD_CONFIG") static final IMAGE_DIRECTORY_ENTRY_LOAD_CONFIG: go.GoInt;
    /**
        IMAGE_DIRECTORY_ENTRY constants
    **/
    @:native("IMAGE_DIRECTORY_ENTRY_RESOURCE") static final IMAGE_DIRECTORY_ENTRY_RESOURCE: go.GoInt;
    /**
        IMAGE_DIRECTORY_ENTRY constants
    **/
    @:native("IMAGE_DIRECTORY_ENTRY_SECURITY") static final IMAGE_DIRECTORY_ENTRY_SECURITY: go.GoInt;
    /**
        IMAGE_DIRECTORY_ENTRY constants
    **/
    @:native("IMAGE_DIRECTORY_ENTRY_TLS") static final IMAGE_DIRECTORY_ENTRY_TLS: go.GoInt;
    /**
        OptionalHeader64.DllCharacteristics and OptionalHeader32.DllCharacteristics
        values. These can be combined together.
    **/
    @:native("IMAGE_DLLCHARACTERISTICS_APPCONTAINER") static final IMAGE_DLLCHARACTERISTICS_APPCONTAINER: go.GoInt;
    /**
        OptionalHeader64.DllCharacteristics and OptionalHeader32.DllCharacteristics
        values. These can be combined together.
    **/
    @:native("IMAGE_DLLCHARACTERISTICS_DYNAMIC_BASE") static final IMAGE_DLLCHARACTERISTICS_DYNAMIC_BASE: go.GoInt;
    /**
        OptionalHeader64.DllCharacteristics and OptionalHeader32.DllCharacteristics
        values. These can be combined together.
    **/
    @:native("IMAGE_DLLCHARACTERISTICS_FORCE_INTEGRITY") static final IMAGE_DLLCHARACTERISTICS_FORCE_INTEGRITY: go.GoInt;
    /**
        OptionalHeader64.DllCharacteristics and OptionalHeader32.DllCharacteristics
        values. These can be combined together.
    **/
    @:native("IMAGE_DLLCHARACTERISTICS_GUARD_CF") static final IMAGE_DLLCHARACTERISTICS_GUARD_CF: go.GoInt;
    /**
        OptionalHeader64.DllCharacteristics and OptionalHeader32.DllCharacteristics
        values. These can be combined together.
    **/
    @:native("IMAGE_DLLCHARACTERISTICS_HIGH_ENTROPY_VA") static final IMAGE_DLLCHARACTERISTICS_HIGH_ENTROPY_VA: go.GoInt;
    /**
        OptionalHeader64.DllCharacteristics and OptionalHeader32.DllCharacteristics
        values. These can be combined together.
    **/
    @:native("IMAGE_DLLCHARACTERISTICS_NO_BIND") static final IMAGE_DLLCHARACTERISTICS_NO_BIND: go.GoInt;
    /**
        OptionalHeader64.DllCharacteristics and OptionalHeader32.DllCharacteristics
        values. These can be combined together.
    **/
    @:native("IMAGE_DLLCHARACTERISTICS_NO_ISOLATION") static final IMAGE_DLLCHARACTERISTICS_NO_ISOLATION: go.GoInt;
    /**
        OptionalHeader64.DllCharacteristics and OptionalHeader32.DllCharacteristics
        values. These can be combined together.
    **/
    @:native("IMAGE_DLLCHARACTERISTICS_NO_SEH") static final IMAGE_DLLCHARACTERISTICS_NO_SEH: go.GoInt;
    /**
        OptionalHeader64.DllCharacteristics and OptionalHeader32.DllCharacteristics
        values. These can be combined together.
    **/
    @:native("IMAGE_DLLCHARACTERISTICS_NX_COMPAT") static final IMAGE_DLLCHARACTERISTICS_NX_COMPAT: go.GoInt;
    /**
        OptionalHeader64.DllCharacteristics and OptionalHeader32.DllCharacteristics
        values. These can be combined together.
    **/
    @:native("IMAGE_DLLCHARACTERISTICS_TERMINAL_SERVER_AWARE") static final IMAGE_DLLCHARACTERISTICS_TERMINAL_SERVER_AWARE: go.GoInt;
    /**
        OptionalHeader64.DllCharacteristics and OptionalHeader32.DllCharacteristics
        values. These can be combined together.
    **/
    @:native("IMAGE_DLLCHARACTERISTICS_WDM_DRIVER") static final IMAGE_DLLCHARACTERISTICS_WDM_DRIVER: go.GoInt;
    /**
        Values of IMAGE_FILE_HEADER.Characteristics. These can be combined together.
    **/
    @:native("IMAGE_FILE_32BIT_MACHINE") static final IMAGE_FILE_32BIT_MACHINE: go.GoInt;
    /**
        Values of IMAGE_FILE_HEADER.Characteristics. These can be combined together.
    **/
    @:native("IMAGE_FILE_AGGRESIVE_WS_TRIM") static final IMAGE_FILE_AGGRESIVE_WS_TRIM: go.GoInt;
    /**
        Values of IMAGE_FILE_HEADER.Characteristics. These can be combined together.
    **/
    @:native("IMAGE_FILE_BYTES_REVERSED_HI") static final IMAGE_FILE_BYTES_REVERSED_HI: go.GoInt;
    /**
        Values of IMAGE_FILE_HEADER.Characteristics. These can be combined together.
    **/
    @:native("IMAGE_FILE_BYTES_REVERSED_LO") static final IMAGE_FILE_BYTES_REVERSED_LO: go.GoInt;
    /**
        Values of IMAGE_FILE_HEADER.Characteristics. These can be combined together.
    **/
    @:native("IMAGE_FILE_DEBUG_STRIPPED") static final IMAGE_FILE_DEBUG_STRIPPED: go.GoInt;
    /**
        Values of IMAGE_FILE_HEADER.Characteristics. These can be combined together.
    **/
    @:native("IMAGE_FILE_DLL") static final IMAGE_FILE_DLL: go.GoInt;
    /**
        Values of IMAGE_FILE_HEADER.Characteristics. These can be combined together.
    **/
    @:native("IMAGE_FILE_EXECUTABLE_IMAGE") static final IMAGE_FILE_EXECUTABLE_IMAGE: go.GoInt;
    /**
        Values of IMAGE_FILE_HEADER.Characteristics. These can be combined together.
    **/
    @:native("IMAGE_FILE_LARGE_ADDRESS_AWARE") static final IMAGE_FILE_LARGE_ADDRESS_AWARE: go.GoInt;
    /**
        Values of IMAGE_FILE_HEADER.Characteristics. These can be combined together.
    **/
    @:native("IMAGE_FILE_LINE_NUMS_STRIPPED") static final IMAGE_FILE_LINE_NUMS_STRIPPED: go.GoInt;
    /**
        Values of IMAGE_FILE_HEADER.Characteristics. These can be combined together.
    **/
    @:native("IMAGE_FILE_LOCAL_SYMS_STRIPPED") static final IMAGE_FILE_LOCAL_SYMS_STRIPPED: go.GoInt;
    @:native("IMAGE_FILE_MACHINE_AM33") static final IMAGE_FILE_MACHINE_AM33: go.GoInt;
    @:native("IMAGE_FILE_MACHINE_AMD64") static final IMAGE_FILE_MACHINE_AMD64: go.GoInt;
    @:native("IMAGE_FILE_MACHINE_ARM") static final IMAGE_FILE_MACHINE_ARM: go.GoInt;
    @:native("IMAGE_FILE_MACHINE_ARM64") static final IMAGE_FILE_MACHINE_ARM64: go.GoInt;
    @:native("IMAGE_FILE_MACHINE_ARMNT") static final IMAGE_FILE_MACHINE_ARMNT: go.GoInt;
    @:native("IMAGE_FILE_MACHINE_EBC") static final IMAGE_FILE_MACHINE_EBC: go.GoInt;
    @:native("IMAGE_FILE_MACHINE_I386") static final IMAGE_FILE_MACHINE_I386: go.GoInt;
    @:native("IMAGE_FILE_MACHINE_IA64") static final IMAGE_FILE_MACHINE_IA64: go.GoInt;
    @:native("IMAGE_FILE_MACHINE_LOONGARCH32") static final IMAGE_FILE_MACHINE_LOONGARCH32: go.GoInt;
    @:native("IMAGE_FILE_MACHINE_LOONGARCH64") static final IMAGE_FILE_MACHINE_LOONGARCH64: go.GoInt;
    @:native("IMAGE_FILE_MACHINE_M32R") static final IMAGE_FILE_MACHINE_M32R: go.GoInt;
    @:native("IMAGE_FILE_MACHINE_MIPS16") static final IMAGE_FILE_MACHINE_MIPS16: go.GoInt;
    @:native("IMAGE_FILE_MACHINE_MIPSFPU") static final IMAGE_FILE_MACHINE_MIPSFPU: go.GoInt;
    @:native("IMAGE_FILE_MACHINE_MIPSFPU16") static final IMAGE_FILE_MACHINE_MIPSFPU16: go.GoInt;
    @:native("IMAGE_FILE_MACHINE_POWERPC") static final IMAGE_FILE_MACHINE_POWERPC: go.GoInt;
    @:native("IMAGE_FILE_MACHINE_POWERPCFP") static final IMAGE_FILE_MACHINE_POWERPCFP: go.GoInt;
    @:native("IMAGE_FILE_MACHINE_R4000") static final IMAGE_FILE_MACHINE_R4000: go.GoInt;
    @:native("IMAGE_FILE_MACHINE_RISCV128") static final IMAGE_FILE_MACHINE_RISCV128: go.GoInt;
    @:native("IMAGE_FILE_MACHINE_RISCV32") static final IMAGE_FILE_MACHINE_RISCV32: go.GoInt;
    @:native("IMAGE_FILE_MACHINE_RISCV64") static final IMAGE_FILE_MACHINE_RISCV64: go.GoInt;
    @:native("IMAGE_FILE_MACHINE_SH3") static final IMAGE_FILE_MACHINE_SH3: go.GoInt;
    @:native("IMAGE_FILE_MACHINE_SH3DSP") static final IMAGE_FILE_MACHINE_SH3DSP: go.GoInt;
    @:native("IMAGE_FILE_MACHINE_SH4") static final IMAGE_FILE_MACHINE_SH4: go.GoInt;
    @:native("IMAGE_FILE_MACHINE_SH5") static final IMAGE_FILE_MACHINE_SH5: go.GoInt;
    @:native("IMAGE_FILE_MACHINE_THUMB") static final IMAGE_FILE_MACHINE_THUMB: go.GoInt;
    @:native("IMAGE_FILE_MACHINE_UNKNOWN") static final IMAGE_FILE_MACHINE_UNKNOWN: go.GoInt;
    @:native("IMAGE_FILE_MACHINE_WCEMIPSV2") static final IMAGE_FILE_MACHINE_WCEMIPSV2: go.GoInt;
    /**
        Values of IMAGE_FILE_HEADER.Characteristics. These can be combined together.
    **/
    @:native("IMAGE_FILE_NET_RUN_FROM_SWAP") static final IMAGE_FILE_NET_RUN_FROM_SWAP: go.GoInt;
    /**
        Values of IMAGE_FILE_HEADER.Characteristics. These can be combined together.
    **/
    @:native("IMAGE_FILE_RELOCS_STRIPPED") static final IMAGE_FILE_RELOCS_STRIPPED: go.GoInt;
    /**
        Values of IMAGE_FILE_HEADER.Characteristics. These can be combined together.
    **/
    @:native("IMAGE_FILE_REMOVABLE_RUN_FROM_SWAP") static final IMAGE_FILE_REMOVABLE_RUN_FROM_SWAP: go.GoInt;
    /**
        Values of IMAGE_FILE_HEADER.Characteristics. These can be combined together.
    **/
    @:native("IMAGE_FILE_SYSTEM") static final IMAGE_FILE_SYSTEM: go.GoInt;
    /**
        Values of IMAGE_FILE_HEADER.Characteristics. These can be combined together.
    **/
    @:native("IMAGE_FILE_UP_SYSTEM_ONLY") static final IMAGE_FILE_UP_SYSTEM_ONLY: go.GoInt;
    /**
        Section characteristics flags.
    **/
    @:native("IMAGE_SCN_CNT_CODE") static final IMAGE_SCN_CNT_CODE: go.GoInt;
    /**
        Section characteristics flags.
    **/
    @:native("IMAGE_SCN_CNT_INITIALIZED_DATA") static final IMAGE_SCN_CNT_INITIALIZED_DATA: go.GoInt;
    /**
        Section characteristics flags.
    **/
    @:native("IMAGE_SCN_CNT_UNINITIALIZED_DATA") static final IMAGE_SCN_CNT_UNINITIALIZED_DATA: go.GoInt;
    /**
        Section characteristics flags.
    **/
    @:native("IMAGE_SCN_LNK_COMDAT") static final IMAGE_SCN_LNK_COMDAT: go.GoInt;
    /**
        Section characteristics flags.
    **/
    @:native("IMAGE_SCN_MEM_DISCARDABLE") static final IMAGE_SCN_MEM_DISCARDABLE: go.GoInt;
    /**
        Section characteristics flags.
    **/
    @:native("IMAGE_SCN_MEM_EXECUTE") static final IMAGE_SCN_MEM_EXECUTE: go.GoInt;
    /**
        Section characteristics flags.
    **/
    @:native("IMAGE_SCN_MEM_READ") static final IMAGE_SCN_MEM_READ: go.GoInt;
    /**
        Section characteristics flags.
    **/
    @:native("IMAGE_SCN_MEM_WRITE") static final IMAGE_SCN_MEM_WRITE: go.GoInt;
    /**
        OptionalHeader64.Subsystem and OptionalHeader32.Subsystem values.
    **/
    @:native("IMAGE_SUBSYSTEM_EFI_APPLICATION") static final IMAGE_SUBSYSTEM_EFI_APPLICATION: go.GoInt;
    /**
        OptionalHeader64.Subsystem and OptionalHeader32.Subsystem values.
    **/
    @:native("IMAGE_SUBSYSTEM_EFI_BOOT_SERVICE_DRIVER") static final IMAGE_SUBSYSTEM_EFI_BOOT_SERVICE_DRIVER: go.GoInt;
    /**
        OptionalHeader64.Subsystem and OptionalHeader32.Subsystem values.
    **/
    @:native("IMAGE_SUBSYSTEM_EFI_ROM") static final IMAGE_SUBSYSTEM_EFI_ROM: go.GoInt;
    /**
        OptionalHeader64.Subsystem and OptionalHeader32.Subsystem values.
    **/
    @:native("IMAGE_SUBSYSTEM_EFI_RUNTIME_DRIVER") static final IMAGE_SUBSYSTEM_EFI_RUNTIME_DRIVER: go.GoInt;
    /**
        OptionalHeader64.Subsystem and OptionalHeader32.Subsystem values.
    **/
    @:native("IMAGE_SUBSYSTEM_NATIVE") static final IMAGE_SUBSYSTEM_NATIVE: go.GoInt;
    /**
        OptionalHeader64.Subsystem and OptionalHeader32.Subsystem values.
    **/
    @:native("IMAGE_SUBSYSTEM_NATIVE_WINDOWS") static final IMAGE_SUBSYSTEM_NATIVE_WINDOWS: go.GoInt;
    /**
        OptionalHeader64.Subsystem and OptionalHeader32.Subsystem values.
    **/
    @:native("IMAGE_SUBSYSTEM_OS2_CUI") static final IMAGE_SUBSYSTEM_OS2_CUI: go.GoInt;
    /**
        OptionalHeader64.Subsystem and OptionalHeader32.Subsystem values.
    **/
    @:native("IMAGE_SUBSYSTEM_POSIX_CUI") static final IMAGE_SUBSYSTEM_POSIX_CUI: go.GoInt;
    /**
        OptionalHeader64.Subsystem and OptionalHeader32.Subsystem values.
    **/
    @:native("IMAGE_SUBSYSTEM_UNKNOWN") static final IMAGE_SUBSYSTEM_UNKNOWN: go.GoInt;
    /**
        OptionalHeader64.Subsystem and OptionalHeader32.Subsystem values.
    **/
    @:native("IMAGE_SUBSYSTEM_WINDOWS_BOOT_APPLICATION") static final IMAGE_SUBSYSTEM_WINDOWS_BOOT_APPLICATION: go.GoInt;
    /**
        OptionalHeader64.Subsystem and OptionalHeader32.Subsystem values.
    **/
    @:native("IMAGE_SUBSYSTEM_WINDOWS_CE_GUI") static final IMAGE_SUBSYSTEM_WINDOWS_CE_GUI: go.GoInt;
    /**
        OptionalHeader64.Subsystem and OptionalHeader32.Subsystem values.
    **/
    @:native("IMAGE_SUBSYSTEM_WINDOWS_CUI") static final IMAGE_SUBSYSTEM_WINDOWS_CUI: go.GoInt;
    /**
        OptionalHeader64.Subsystem and OptionalHeader32.Subsystem values.
    **/
    @:native("IMAGE_SUBSYSTEM_WINDOWS_GUI") static final IMAGE_SUBSYSTEM_WINDOWS_GUI: go.GoInt;
    /**
        OptionalHeader64.Subsystem and OptionalHeader32.Subsystem values.
    **/
    @:native("IMAGE_SUBSYSTEM_XBOX") static final IMAGE_SUBSYSTEM_XBOX: go.GoInt;

    /**
        NewFile creates a new [File] for accessing a PE binary in an underlying reader.
    **/
    @:native("NewFile") static function newFile(r: go.io.ReaderAt): (go.Result<go.Pointer<go.debug.pe.File>>);
    /**
        Open opens the named file using [os.Open] and prepares it for use as a PE binary.
    **/
    @:native("Open") static function open(name: String): (go.Result<go.Pointer<go.debug.pe.File>>);

}