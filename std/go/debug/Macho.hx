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

    @:native("ARM64_RELOC_ADDEND") static final ARM64_RELOC_ADDEND: go.debug.macho.RelocTypeARM64;
    @:native("ARM64_RELOC_BRANCH26") static final ARM64_RELOC_BRANCH26: go.debug.macho.RelocTypeARM64;
    @:native("ARM64_RELOC_GOT_LOAD_PAGE21") static final ARM64_RELOC_GOT_LOAD_PAGE21: go.debug.macho.RelocTypeARM64;
    @:native("ARM64_RELOC_GOT_LOAD_PAGEOFF12") static final ARM64_RELOC_GOT_LOAD_PAGEOFF12: go.debug.macho.RelocTypeARM64;
    @:native("ARM64_RELOC_PAGE21") static final ARM64_RELOC_PAGE21: go.debug.macho.RelocTypeARM64;
    @:native("ARM64_RELOC_PAGEOFF12") static final ARM64_RELOC_PAGEOFF12: go.debug.macho.RelocTypeARM64;
    @:native("ARM64_RELOC_POINTER_TO_GOT") static final ARM64_RELOC_POINTER_TO_GOT: go.debug.macho.RelocTypeARM64;
    @:native("ARM64_RELOC_SUBTRACTOR") static final ARM64_RELOC_SUBTRACTOR: go.debug.macho.RelocTypeARM64;
    @:native("ARM64_RELOC_TLVP_LOAD_PAGE21") static final ARM64_RELOC_TLVP_LOAD_PAGE21: go.debug.macho.RelocTypeARM64;
    @:native("ARM64_RELOC_TLVP_LOAD_PAGEOFF12") static final ARM64_RELOC_TLVP_LOAD_PAGEOFF12: go.debug.macho.RelocTypeARM64;
    @:native("ARM64_RELOC_UNSIGNED") static final ARM64_RELOC_UNSIGNED: go.debug.macho.RelocTypeARM64;
    @:native("ARM_RELOC_BR24") static final ARM_RELOC_BR24: go.debug.macho.RelocTypeARM;
    @:native("ARM_RELOC_HALF") static final ARM_RELOC_HALF: go.debug.macho.RelocTypeARM;
    @:native("ARM_RELOC_HALF_SECTDIFF") static final ARM_RELOC_HALF_SECTDIFF: go.debug.macho.RelocTypeARM;
    @:native("ARM_RELOC_LOCAL_SECTDIFF") static final ARM_RELOC_LOCAL_SECTDIFF: go.debug.macho.RelocTypeARM;
    @:native("ARM_RELOC_PAIR") static final ARM_RELOC_PAIR: go.debug.macho.RelocTypeARM;
    @:native("ARM_RELOC_PB_LA_PTR") static final ARM_RELOC_PB_LA_PTR: go.debug.macho.RelocTypeARM;
    @:native("ARM_RELOC_SECTDIFF") static final ARM_RELOC_SECTDIFF: go.debug.macho.RelocTypeARM;
    @:native("ARM_RELOC_VANILLA") static final ARM_RELOC_VANILLA: go.debug.macho.RelocTypeARM;
    @:native("ARM_THUMB_32BIT_BRANCH") static final ARM_THUMB_32BIT_BRANCH: go.debug.macho.RelocTypeARM;
    @:native("ARM_THUMB_RELOC_BR22") static final ARM_THUMB_RELOC_BR22: go.debug.macho.RelocTypeARM;
    @:native("Cpu386") static final cpu386: go.debug.macho.Cpu;
    @:native("CpuAmd64") static final cpuAmd64: go.debug.macho.Cpu;
    @:native("CpuArm") static final cpuArm: go.debug.macho.Cpu;
    @:native("CpuArm64") static final cpuArm64: go.debug.macho.Cpu;
    @:native("CpuPpc") static final cpuPpc: go.debug.macho.Cpu;
    @:native("CpuPpc64") static final cpuPpc64: go.debug.macho.Cpu;
    @:native("FlagAllModsBound") static final flagAllModsBound: go.UInt32;
    @:native("FlagAllowStackExecution") static final flagAllowStackExecution: go.UInt32;
    @:native("FlagAppExtensionSafe") static final flagAppExtensionSafe: go.UInt32;
    @:native("FlagBindAtLoad") static final flagBindAtLoad: go.UInt32;
    @:native("FlagBindsToWeak") static final flagBindsToWeak: go.UInt32;
    @:native("FlagCanonical") static final flagCanonical: go.UInt32;
    @:native("FlagDeadStrippableDylib") static final flagDeadStrippableDylib: go.UInt32;
    @:native("FlagDyldLink") static final flagDyldLink: go.UInt32;
    @:native("FlagForceFlat") static final flagForceFlat: go.UInt32;
    @:native("FlagHasTLVDescriptors") static final flagHasTLVDescriptors: go.UInt32;
    @:native("FlagIncrLink") static final flagIncrLink: go.UInt32;
    @:native("FlagLazyInit") static final flagLazyInit: go.UInt32;
    @:native("FlagNoFixPrebinding") static final flagNoFixPrebinding: go.UInt32;
    @:native("FlagNoHeapExecution") static final flagNoHeapExecution: go.UInt32;
    @:native("FlagNoMultiDefs") static final flagNoMultiDefs: go.UInt32;
    @:native("FlagNoReexportedDylibs") static final flagNoReexportedDylibs: go.UInt32;
    @:native("FlagNoUndefs") static final flagNoUndefs: go.UInt32;
    @:native("FlagPIE") static final flagPIE: go.UInt32;
    @:native("FlagPrebindable") static final flagPrebindable: go.UInt32;
    @:native("FlagPrebound") static final flagPrebound: go.UInt32;
    @:native("FlagRootSafe") static final flagRootSafe: go.UInt32;
    @:native("FlagSetuidSafe") static final flagSetuidSafe: go.UInt32;
    @:native("FlagSplitSegs") static final flagSplitSegs: go.UInt32;
    @:native("FlagSubsectionsViaSymbols") static final flagSubsectionsViaSymbols: go.UInt32;
    @:native("FlagTwoLevel") static final flagTwoLevel: go.UInt32;
    @:native("FlagWeakDefines") static final flagWeakDefines: go.UInt32;
    @:native("GENERIC_RELOC_LOCAL_SECTDIFF") static final GENERIC_RELOC_LOCAL_SECTDIFF: go.debug.macho.RelocTypeGeneric;
    @:native("GENERIC_RELOC_PAIR") static final GENERIC_RELOC_PAIR: go.debug.macho.RelocTypeGeneric;
    @:native("GENERIC_RELOC_PB_LA_PTR") static final GENERIC_RELOC_PB_LA_PTR: go.debug.macho.RelocTypeGeneric;
    @:native("GENERIC_RELOC_SECTDIFF") static final GENERIC_RELOC_SECTDIFF: go.debug.macho.RelocTypeGeneric;
    @:native("GENERIC_RELOC_TLV") static final GENERIC_RELOC_TLV: go.debug.macho.RelocTypeGeneric;
    @:native("GENERIC_RELOC_VANILLA") static final GENERIC_RELOC_VANILLA: go.debug.macho.RelocTypeGeneric;
    @:native("LoadCmdDylib") static final loadCmdDylib: go.debug.macho.LoadCmd;
    @:native("LoadCmdDylinker") static final loadCmdDylinker: go.debug.macho.LoadCmd;
    @:native("LoadCmdDysymtab") static final loadCmdDysymtab: go.debug.macho.LoadCmd;
    @:native("LoadCmdRpath") static final loadCmdRpath: go.debug.macho.LoadCmd;
    @:native("LoadCmdSegment") static final loadCmdSegment: go.debug.macho.LoadCmd;
    @:native("LoadCmdSegment64") static final loadCmdSegment64: go.debug.macho.LoadCmd;
    @:native("LoadCmdSymtab") static final loadCmdSymtab: go.debug.macho.LoadCmd;
    @:native("LoadCmdThread") static final loadCmdThread: go.debug.macho.LoadCmd;
    @:native("LoadCmdUnixThread") static final loadCmdUnixThread: go.debug.macho.LoadCmd;
    @:native("Magic32") static final magic32: go.UInt32;
    @:native("Magic64") static final magic64: go.UInt32;
    @:native("MagicFat") static final magicFat: go.UInt32;
    @:native("TypeBundle") static final typeBundle: go.debug.macho.Type;
    @:native("TypeDylib") static final typeDylib: go.debug.macho.Type;
    @:native("TypeExec") static final typeExec: go.debug.macho.Type;
    @:native("TypeObj") static final typeObj: go.debug.macho.Type;
    @:native("X86_64_RELOC_BRANCH") static final X86_64_RELOC_BRANCH: go.debug.macho.RelocTypeX86_64;
    @:native("X86_64_RELOC_GOT") static final X86_64_RELOC_GOT: go.debug.macho.RelocTypeX86_64;
    @:native("X86_64_RELOC_GOT_LOAD") static final X86_64_RELOC_GOT_LOAD: go.debug.macho.RelocTypeX86_64;
    @:native("X86_64_RELOC_SIGNED") static final X86_64_RELOC_SIGNED: go.debug.macho.RelocTypeX86_64;
    @:native("X86_64_RELOC_SIGNED_1") static final X86_64_RELOC_SIGNED_1: go.debug.macho.RelocTypeX86_64;
    @:native("X86_64_RELOC_SIGNED_2") static final X86_64_RELOC_SIGNED_2: go.debug.macho.RelocTypeX86_64;
    @:native("X86_64_RELOC_SIGNED_4") static final X86_64_RELOC_SIGNED_4: go.debug.macho.RelocTypeX86_64;
    @:native("X86_64_RELOC_SUBTRACTOR") static final X86_64_RELOC_SUBTRACTOR: go.debug.macho.RelocTypeX86_64;
    @:native("X86_64_RELOC_TLV") static final X86_64_RELOC_TLV: go.debug.macho.RelocTypeX86_64;
    @:native("X86_64_RELOC_UNSIGNED") static final X86_64_RELOC_UNSIGNED: go.debug.macho.RelocTypeX86_64;

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