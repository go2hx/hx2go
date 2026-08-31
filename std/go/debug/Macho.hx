package go.debug;

/**
    Package macho implements access to Mach-O object files.
    
    # Security
    
    This package is not designed to be hardened against adversarial inputs, and is
    outside the scope of https://go.dev/security/policy. In particular, only basic
    validation is done when parsing object files. As such, care should be taken when
    parsing untrusted inputs, as parsing malformed files may consume significant
    resources, or cause panics.
**/
@:go.Type({ name: "macho", instanceName: "macho.macho", imports: ["debug/macho"] })
extern class Macho {

    @:native("ARM64_RELOC_ADDEND") static var ARM64_RELOC_ADDEND: go.debug.macho.RelocTypeARM64;
    @:native("ARM64_RELOC_BRANCH26") static var ARM64_RELOC_BRANCH26: go.debug.macho.RelocTypeARM64;
    @:native("ARM64_RELOC_GOT_LOAD_PAGE21") static var ARM64_RELOC_GOT_LOAD_PAGE21: go.debug.macho.RelocTypeARM64;
    @:native("ARM64_RELOC_GOT_LOAD_PAGEOFF12") static var ARM64_RELOC_GOT_LOAD_PAGEOFF12: go.debug.macho.RelocTypeARM64;
    @:native("ARM64_RELOC_PAGE21") static var ARM64_RELOC_PAGE21: go.debug.macho.RelocTypeARM64;
    @:native("ARM64_RELOC_PAGEOFF12") static var ARM64_RELOC_PAGEOFF12: go.debug.macho.RelocTypeARM64;
    @:native("ARM64_RELOC_POINTER_TO_GOT") static var ARM64_RELOC_POINTER_TO_GOT: go.debug.macho.RelocTypeARM64;
    @:native("ARM64_RELOC_SUBTRACTOR") static var ARM64_RELOC_SUBTRACTOR: go.debug.macho.RelocTypeARM64;
    @:native("ARM64_RELOC_TLVP_LOAD_PAGE21") static var ARM64_RELOC_TLVP_LOAD_PAGE21: go.debug.macho.RelocTypeARM64;
    @:native("ARM64_RELOC_TLVP_LOAD_PAGEOFF12") static var ARM64_RELOC_TLVP_LOAD_PAGEOFF12: go.debug.macho.RelocTypeARM64;
    @:native("ARM64_RELOC_UNSIGNED") static var ARM64_RELOC_UNSIGNED: go.debug.macho.RelocTypeARM64;
    @:native("ARM_RELOC_BR24") static var ARM_RELOC_BR24: go.debug.macho.RelocTypeARM;
    @:native("ARM_RELOC_HALF") static var ARM_RELOC_HALF: go.debug.macho.RelocTypeARM;
    @:native("ARM_RELOC_HALF_SECTDIFF") static var ARM_RELOC_HALF_SECTDIFF: go.debug.macho.RelocTypeARM;
    @:native("ARM_RELOC_LOCAL_SECTDIFF") static var ARM_RELOC_LOCAL_SECTDIFF: go.debug.macho.RelocTypeARM;
    @:native("ARM_RELOC_PAIR") static var ARM_RELOC_PAIR: go.debug.macho.RelocTypeARM;
    @:native("ARM_RELOC_PB_LA_PTR") static var ARM_RELOC_PB_LA_PTR: go.debug.macho.RelocTypeARM;
    @:native("ARM_RELOC_SECTDIFF") static var ARM_RELOC_SECTDIFF: go.debug.macho.RelocTypeARM;
    @:native("ARM_RELOC_VANILLA") static var ARM_RELOC_VANILLA: go.debug.macho.RelocTypeARM;
    @:native("ARM_THUMB_32BIT_BRANCH") static var ARM_THUMB_32BIT_BRANCH: go.debug.macho.RelocTypeARM;
    @:native("ARM_THUMB_RELOC_BR22") static var ARM_THUMB_RELOC_BR22: go.debug.macho.RelocTypeARM;
    @:native("Cpu386") static var cpu386: go.debug.macho.Cpu;
    @:native("CpuAmd64") static var cpuAmd64: go.debug.macho.Cpu;
    @:native("CpuArm") static var cpuArm: go.debug.macho.Cpu;
    @:native("CpuArm64") static var cpuArm64: go.debug.macho.Cpu;
    @:native("CpuPpc") static var cpuPpc: go.debug.macho.Cpu;
    @:native("CpuPpc64") static var cpuPpc64: go.debug.macho.Cpu;
    @:native("FlagAllModsBound") static var flagAllModsBound: go.UInt32;
    @:native("FlagAllowStackExecution") static var flagAllowStackExecution: go.UInt32;
    @:native("FlagAppExtensionSafe") static var flagAppExtensionSafe: go.UInt32;
    @:native("FlagBindAtLoad") static var flagBindAtLoad: go.UInt32;
    @:native("FlagBindsToWeak") static var flagBindsToWeak: go.UInt32;
    @:native("FlagCanonical") static var flagCanonical: go.UInt32;
    @:native("FlagDeadStrippableDylib") static var flagDeadStrippableDylib: go.UInt32;
    @:native("FlagDyldLink") static var flagDyldLink: go.UInt32;
    @:native("FlagForceFlat") static var flagForceFlat: go.UInt32;
    @:native("FlagHasTLVDescriptors") static var flagHasTLVDescriptors: go.UInt32;
    @:native("FlagIncrLink") static var flagIncrLink: go.UInt32;
    @:native("FlagLazyInit") static var flagLazyInit: go.UInt32;
    @:native("FlagNoFixPrebinding") static var flagNoFixPrebinding: go.UInt32;
    @:native("FlagNoHeapExecution") static var flagNoHeapExecution: go.UInt32;
    @:native("FlagNoMultiDefs") static var flagNoMultiDefs: go.UInt32;
    @:native("FlagNoReexportedDylibs") static var flagNoReexportedDylibs: go.UInt32;
    @:native("FlagNoUndefs") static var flagNoUndefs: go.UInt32;
    @:native("FlagPIE") static var flagPIE: go.UInt32;
    @:native("FlagPrebindable") static var flagPrebindable: go.UInt32;
    @:native("FlagPrebound") static var flagPrebound: go.UInt32;
    @:native("FlagRootSafe") static var flagRootSafe: go.UInt32;
    @:native("FlagSetuidSafe") static var flagSetuidSafe: go.UInt32;
    @:native("FlagSplitSegs") static var flagSplitSegs: go.UInt32;
    @:native("FlagSubsectionsViaSymbols") static var flagSubsectionsViaSymbols: go.UInt32;
    @:native("FlagTwoLevel") static var flagTwoLevel: go.UInt32;
    @:native("FlagWeakDefines") static var flagWeakDefines: go.UInt32;
    @:native("GENERIC_RELOC_LOCAL_SECTDIFF") static var GENERIC_RELOC_LOCAL_SECTDIFF: go.debug.macho.RelocTypeGeneric;
    @:native("GENERIC_RELOC_PAIR") static var GENERIC_RELOC_PAIR: go.debug.macho.RelocTypeGeneric;
    @:native("GENERIC_RELOC_PB_LA_PTR") static var GENERIC_RELOC_PB_LA_PTR: go.debug.macho.RelocTypeGeneric;
    @:native("GENERIC_RELOC_SECTDIFF") static var GENERIC_RELOC_SECTDIFF: go.debug.macho.RelocTypeGeneric;
    @:native("GENERIC_RELOC_TLV") static var GENERIC_RELOC_TLV: go.debug.macho.RelocTypeGeneric;
    @:native("GENERIC_RELOC_VANILLA") static var GENERIC_RELOC_VANILLA: go.debug.macho.RelocTypeGeneric;
    @:native("LoadCmdDylib") static var loadCmdDylib: go.debug.macho.LoadCmd;
    @:native("LoadCmdDylinker") static var loadCmdDylinker: go.debug.macho.LoadCmd;
    @:native("LoadCmdDysymtab") static var loadCmdDysymtab: go.debug.macho.LoadCmd;
    @:native("LoadCmdRpath") static var loadCmdRpath: go.debug.macho.LoadCmd;
    @:native("LoadCmdSegment") static var loadCmdSegment: go.debug.macho.LoadCmd;
    @:native("LoadCmdSegment64") static var loadCmdSegment64: go.debug.macho.LoadCmd;
    @:native("LoadCmdSymtab") static var loadCmdSymtab: go.debug.macho.LoadCmd;
    @:native("LoadCmdThread") static var loadCmdThread: go.debug.macho.LoadCmd;
    @:native("LoadCmdUnixThread") static var loadCmdUnixThread: go.debug.macho.LoadCmd;
    @:native("Magic32") static var magic32: go.UInt32;
    @:native("Magic64") static var magic64: go.UInt32;
    @:native("MagicFat") static var magicFat: go.UInt32;
    @:native("TypeBundle") static var typeBundle: go.debug.macho.Type;
    @:native("TypeDylib") static var typeDylib: go.debug.macho.Type;
    @:native("TypeExec") static var typeExec: go.debug.macho.Type;
    @:native("TypeObj") static var typeObj: go.debug.macho.Type;
    @:native("X86_64_RELOC_BRANCH") static var X86_64_RELOC_BRANCH: go.debug.macho.RelocTypeX86_64;
    @:native("X86_64_RELOC_GOT") static var X86_64_RELOC_GOT: go.debug.macho.RelocTypeX86_64;
    @:native("X86_64_RELOC_GOT_LOAD") static var X86_64_RELOC_GOT_LOAD: go.debug.macho.RelocTypeX86_64;
    @:native("X86_64_RELOC_SIGNED") static var X86_64_RELOC_SIGNED: go.debug.macho.RelocTypeX86_64;
    @:native("X86_64_RELOC_SIGNED_1") static var X86_64_RELOC_SIGNED_1: go.debug.macho.RelocTypeX86_64;
    @:native("X86_64_RELOC_SIGNED_2") static var X86_64_RELOC_SIGNED_2: go.debug.macho.RelocTypeX86_64;
    @:native("X86_64_RELOC_SIGNED_4") static var X86_64_RELOC_SIGNED_4: go.debug.macho.RelocTypeX86_64;
    @:native("X86_64_RELOC_SUBTRACTOR") static var X86_64_RELOC_SUBTRACTOR: go.debug.macho.RelocTypeX86_64;
    @:native("X86_64_RELOC_TLV") static var X86_64_RELOC_TLV: go.debug.macho.RelocTypeX86_64;
    @:native("X86_64_RELOC_UNSIGNED") static var X86_64_RELOC_UNSIGNED: go.debug.macho.RelocTypeX86_64;

    /**
        ErrNotFat is returned from [NewFatFile] or [OpenFat] when the file is not a
        universal binary but may be a thin binary, based on its magic number.
    **/
    @:native("ErrNotFat") static var errNotFat: go.Pointer<go.debug.macho.FormatError>;

    /**
        NewFatFile creates a new [FatFile] for accessing all the Mach-O images in a
        universal binary. The Mach-O binary is expected to start at position 0 in
        the ReaderAt.
    **/
    @:native("NewFatFile") static function newFatFile(r: go.io.ReaderAt): (go.Result<go.Pointer<go.debug.macho.FatFile>>);
    /**
        NewFile creates a new [File] for accessing a Mach-O binary in an underlying reader.
        The Mach-O binary is expected to start at position 0 in the ReaderAt.
    **/
    @:native("NewFile") static function newFile(r: go.io.ReaderAt): (go.Result<go.Pointer<go.debug.macho.File>>);
    /**
        Open opens the named file using [os.Open] and prepares it for use as a Mach-O binary.
    **/
    @:native("Open") static function open(name: String): (go.Result<go.Pointer<go.debug.macho.File>>);
    /**
        OpenFat opens the named file using [os.Open] and prepares it for use as a Mach-O
        universal binary.
    **/
    @:native("OpenFat") static function openFat(name: String): (go.Result<go.Pointer<go.debug.macho.FatFile>>);

}