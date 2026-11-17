package go.debug;

/**
    Package dwarf provides access to DWARF debugging information loaded from
    executable files, as defined in the DWARF 2.0 Standard at
    http://dwarfstd.org/doc/dwarf-2.0.0.pdf.
    
    # Security
    
    This package is not designed to be hardened against adversarial inputs, and is
    outside the scope of https://go.dev/security/policy. In particular, only basic
    validation is done when parsing object files. As such, care should be taken when
    parsing untrusted inputs, as parsing malformed files may consume significant
    resources, or cause panics.
**/
@:go.Type({ name: "dwarf", instanceName: "dwarf.dwarf", imports: ["debug/dwarf"] })
extern class Dwarf {

    @:native("AttrAbstractOrigin") static final attrAbstractOrigin: go.debug.dwarf.Attr;
    @:native("AttrAccessibility") static final attrAccessibility: go.debug.dwarf.Attr;
    @:native("AttrAddrBase") static final attrAddrBase: go.debug.dwarf.Attr;
    @:native("AttrAddrClass") static final attrAddrClass: go.debug.dwarf.Attr;
    @:native("AttrAlignment") static final attrAlignment: go.debug.dwarf.Attr;
    @:native("AttrAllocated") static final attrAllocated: go.debug.dwarf.Attr;
    @:native("AttrArtificial") static final attrArtificial: go.debug.dwarf.Attr;
    @:native("AttrAssociated") static final attrAssociated: go.debug.dwarf.Attr;
    @:native("AttrBaseTypes") static final attrBaseTypes: go.debug.dwarf.Attr;
    @:native("AttrBinaryScale") static final attrBinaryScale: go.debug.dwarf.Attr;
    @:native("AttrBitOffset") static final attrBitOffset: go.debug.dwarf.Attr;
    @:native("AttrBitSize") static final attrBitSize: go.debug.dwarf.Attr;
    @:native("AttrByteSize") static final attrByteSize: go.debug.dwarf.Attr;
    @:native("AttrCallAllCalls") static final attrCallAllCalls: go.debug.dwarf.Attr;
    @:native("AttrCallAllSourceCalls") static final attrCallAllSourceCalls: go.debug.dwarf.Attr;
    @:native("AttrCallAllTailCalls") static final attrCallAllTailCalls: go.debug.dwarf.Attr;
    @:native("AttrCallColumn") static final attrCallColumn: go.debug.dwarf.Attr;
    @:native("AttrCallDataLocation") static final attrCallDataLocation: go.debug.dwarf.Attr;
    @:native("AttrCallDataValue") static final attrCallDataValue: go.debug.dwarf.Attr;
    @:native("AttrCallFile") static final attrCallFile: go.debug.dwarf.Attr;
    @:native("AttrCallLine") static final attrCallLine: go.debug.dwarf.Attr;
    @:native("AttrCallOrigin") static final attrCallOrigin: go.debug.dwarf.Attr;
    @:native("AttrCallPC") static final attrCallPC: go.debug.dwarf.Attr;
    @:native("AttrCallParameter") static final attrCallParameter: go.debug.dwarf.Attr;
    @:native("AttrCallReturnPC") static final attrCallReturnPC: go.debug.dwarf.Attr;
    @:native("AttrCallTailCall") static final attrCallTailCall: go.debug.dwarf.Attr;
    @:native("AttrCallTarget") static final attrCallTarget: go.debug.dwarf.Attr;
    @:native("AttrCallTargetClobbered") static final attrCallTargetClobbered: go.debug.dwarf.Attr;
    @:native("AttrCallValue") static final attrCallValue: go.debug.dwarf.Attr;
    @:native("AttrCalling") static final attrCalling: go.debug.dwarf.Attr;
    @:native("AttrCommonRef") static final attrCommonRef: go.debug.dwarf.Attr;
    @:native("AttrCompDir") static final attrCompDir: go.debug.dwarf.Attr;
    @:native("AttrConstExpr") static final attrConstExpr: go.debug.dwarf.Attr;
    @:native("AttrConstValue") static final attrConstValue: go.debug.dwarf.Attr;
    @:native("AttrContainingType") static final attrContainingType: go.debug.dwarf.Attr;
    @:native("AttrCount") static final attrCount: go.debug.dwarf.Attr;
    @:native("AttrDataBitOffset") static final attrDataBitOffset: go.debug.dwarf.Attr;
    @:native("AttrDataLocation") static final attrDataLocation: go.debug.dwarf.Attr;
    @:native("AttrDataMemberLoc") static final attrDataMemberLoc: go.debug.dwarf.Attr;
    @:native("AttrDecimalScale") static final attrDecimalScale: go.debug.dwarf.Attr;
    @:native("AttrDecimalSign") static final attrDecimalSign: go.debug.dwarf.Attr;
    @:native("AttrDeclColumn") static final attrDeclColumn: go.debug.dwarf.Attr;
    @:native("AttrDeclFile") static final attrDeclFile: go.debug.dwarf.Attr;
    @:native("AttrDeclLine") static final attrDeclLine: go.debug.dwarf.Attr;
    @:native("AttrDeclaration") static final attrDeclaration: go.debug.dwarf.Attr;
    @:native("AttrDefaultValue") static final attrDefaultValue: go.debug.dwarf.Attr;
    @:native("AttrDefaulted") static final attrDefaulted: go.debug.dwarf.Attr;
    @:native("AttrDeleted") static final attrDeleted: go.debug.dwarf.Attr;
    @:native("AttrDescription") static final attrDescription: go.debug.dwarf.Attr;
    @:native("AttrDigitCount") static final attrDigitCount: go.debug.dwarf.Attr;
    @:native("AttrDiscr") static final attrDiscr: go.debug.dwarf.Attr;
    @:native("AttrDiscrList") static final attrDiscrList: go.debug.dwarf.Attr;
    @:native("AttrDiscrValue") static final attrDiscrValue: go.debug.dwarf.Attr;
    @:native("AttrDwoName") static final attrDwoName: go.debug.dwarf.Attr;
    @:native("AttrElemental") static final attrElemental: go.debug.dwarf.Attr;
    @:native("AttrEncoding") static final attrEncoding: go.debug.dwarf.Attr;
    @:native("AttrEndianity") static final attrEndianity: go.debug.dwarf.Attr;
    @:native("AttrEntrypc") static final attrEntrypc: go.debug.dwarf.Attr;
    @:native("AttrEnumClass") static final attrEnumClass: go.debug.dwarf.Attr;
    @:native("AttrExplicit") static final attrExplicit: go.debug.dwarf.Attr;
    @:native("AttrExportSymbols") static final attrExportSymbols: go.debug.dwarf.Attr;
    @:native("AttrExtension") static final attrExtension: go.debug.dwarf.Attr;
    @:native("AttrExternal") static final attrExternal: go.debug.dwarf.Attr;
    @:native("AttrFrameBase") static final attrFrameBase: go.debug.dwarf.Attr;
    @:native("AttrFriend") static final attrFriend: go.debug.dwarf.Attr;
    @:native("AttrHighpc") static final attrHighpc: go.debug.dwarf.Attr;
    @:native("AttrIdentifierCase") static final attrIdentifierCase: go.debug.dwarf.Attr;
    @:native("AttrImport") static final attrImport: go.debug.dwarf.Attr;
    @:native("AttrInline") static final attrInline: go.debug.dwarf.Attr;
    @:native("AttrIsOptional") static final attrIsOptional: go.debug.dwarf.Attr;
    @:native("AttrLanguage") static final attrLanguage: go.debug.dwarf.Attr;
    @:native("AttrLinkageName") static final attrLinkageName: go.debug.dwarf.Attr;
    @:native("AttrLocation") static final attrLocation: go.debug.dwarf.Attr;
    @:native("AttrLoclistsBase") static final attrLoclistsBase: go.debug.dwarf.Attr;
    @:native("AttrLowerBound") static final attrLowerBound: go.debug.dwarf.Attr;
    @:native("AttrLowpc") static final attrLowpc: go.debug.dwarf.Attr;
    @:native("AttrMacroInfo") static final attrMacroInfo: go.debug.dwarf.Attr;
    @:native("AttrMacros") static final attrMacros: go.debug.dwarf.Attr;
    @:native("AttrMainSubprogram") static final attrMainSubprogram: go.debug.dwarf.Attr;
    @:native("AttrMutable") static final attrMutable: go.debug.dwarf.Attr;
    @:native("AttrName") static final attrName: go.debug.dwarf.Attr;
    @:native("AttrNamelistItem") static final attrNamelistItem: go.debug.dwarf.Attr;
    @:native("AttrNoreturn") static final attrNoreturn: go.debug.dwarf.Attr;
    @:native("AttrObjectPointer") static final attrObjectPointer: go.debug.dwarf.Attr;
    @:native("AttrOrdering") static final attrOrdering: go.debug.dwarf.Attr;
    @:native("AttrPictureString") static final attrPictureString: go.debug.dwarf.Attr;
    @:native("AttrPriority") static final attrPriority: go.debug.dwarf.Attr;
    @:native("AttrProducer") static final attrProducer: go.debug.dwarf.Attr;
    @:native("AttrPrototyped") static final attrPrototyped: go.debug.dwarf.Attr;
    @:native("AttrPure") static final attrPure: go.debug.dwarf.Attr;
    @:native("AttrRanges") static final attrRanges: go.debug.dwarf.Attr;
    @:native("AttrRank") static final attrRank: go.debug.dwarf.Attr;
    @:native("AttrRecursive") static final attrRecursive: go.debug.dwarf.Attr;
    @:native("AttrReference") static final attrReference: go.debug.dwarf.Attr;
    @:native("AttrReturnAddr") static final attrReturnAddr: go.debug.dwarf.Attr;
    @:native("AttrRnglistsBase") static final attrRnglistsBase: go.debug.dwarf.Attr;
    @:native("AttrRvalueReference") static final attrRvalueReference: go.debug.dwarf.Attr;
    @:native("AttrSegment") static final attrSegment: go.debug.dwarf.Attr;
    @:native("AttrSibling") static final attrSibling: go.debug.dwarf.Attr;
    @:native("AttrSignature") static final attrSignature: go.debug.dwarf.Attr;
    @:native("AttrSmall") static final attrSmall: go.debug.dwarf.Attr;
    @:native("AttrSpecification") static final attrSpecification: go.debug.dwarf.Attr;
    @:native("AttrStartScope") static final attrStartScope: go.debug.dwarf.Attr;
    @:native("AttrStaticLink") static final attrStaticLink: go.debug.dwarf.Attr;
    @:native("AttrStmtList") static final attrStmtList: go.debug.dwarf.Attr;
    @:native("AttrStrOffsetsBase") static final attrStrOffsetsBase: go.debug.dwarf.Attr;
    @:native("AttrStride") static final attrStride: go.debug.dwarf.Attr;
    @:native("AttrStrideSize") static final attrStrideSize: go.debug.dwarf.Attr;
    @:native("AttrStringLength") static final attrStringLength: go.debug.dwarf.Attr;
    @:native("AttrStringLengthBitSize") static final attrStringLengthBitSize: go.debug.dwarf.Attr;
    @:native("AttrStringLengthByteSize") static final attrStringLengthByteSize: go.debug.dwarf.Attr;
    @:native("AttrThreadsScaled") static final attrThreadsScaled: go.debug.dwarf.Attr;
    @:native("AttrTrampoline") static final attrTrampoline: go.debug.dwarf.Attr;
    @:native("AttrType") static final attrType: go.debug.dwarf.Attr;
    @:native("AttrUpperBound") static final attrUpperBound: go.debug.dwarf.Attr;
    @:native("AttrUseLocation") static final attrUseLocation: go.debug.dwarf.Attr;
    @:native("AttrUseUTF8") static final attrUseUTF8: go.debug.dwarf.Attr;
    @:native("AttrVarParam") static final attrVarParam: go.debug.dwarf.Attr;
    @:native("AttrVirtuality") static final attrVirtuality: go.debug.dwarf.Attr;
    @:native("AttrVisibility") static final attrVisibility: go.debug.dwarf.Attr;
    @:native("AttrVtableElemLoc") static final attrVtableElemLoc: go.debug.dwarf.Attr;
    @:native("ClassAddrPtr") static final classAddrPtr: go.debug.dwarf.Class;
    @:native("ClassAddress") static final classAddress: go.debug.dwarf.Class;
    @:native("ClassBlock") static final classBlock: go.debug.dwarf.Class;
    @:native("ClassConstant") static final classConstant: go.debug.dwarf.Class;
    @:native("ClassExprLoc") static final classExprLoc: go.debug.dwarf.Class;
    @:native("ClassFlag") static final classFlag: go.debug.dwarf.Class;
    @:native("ClassLinePtr") static final classLinePtr: go.debug.dwarf.Class;
    @:native("ClassLocList") static final classLocList: go.debug.dwarf.Class;
    @:native("ClassLocListPtr") static final classLocListPtr: go.debug.dwarf.Class;
    @:native("ClassMacPtr") static final classMacPtr: go.debug.dwarf.Class;
    @:native("ClassRangeListPtr") static final classRangeListPtr: go.debug.dwarf.Class;
    @:native("ClassReference") static final classReference: go.debug.dwarf.Class;
    @:native("ClassReferenceAlt") static final classReferenceAlt: go.debug.dwarf.Class;
    @:native("ClassReferenceSig") static final classReferenceSig: go.debug.dwarf.Class;
    @:native("ClassRngList") static final classRngList: go.debug.dwarf.Class;
    @:native("ClassRngListsPtr") static final classRngListsPtr: go.debug.dwarf.Class;
    @:native("ClassStrOffsetsPtr") static final classStrOffsetsPtr: go.debug.dwarf.Class;
    @:native("ClassString") static final classString: go.debug.dwarf.Class;
    @:native("ClassStringAlt") static final classStringAlt: go.debug.dwarf.Class;
    @:native("ClassUnknown") static final classUnknown: go.debug.dwarf.Class;
    @:native("TagAccessDeclaration") static final tagAccessDeclaration: go.debug.dwarf.Tag;
    @:native("TagArrayType") static final tagArrayType: go.debug.dwarf.Tag;
    @:native("TagAtomicType") static final tagAtomicType: go.debug.dwarf.Tag;
    @:native("TagBaseType") static final tagBaseType: go.debug.dwarf.Tag;
    @:native("TagCallSite") static final tagCallSite: go.debug.dwarf.Tag;
    @:native("TagCallSiteParameter") static final tagCallSiteParameter: go.debug.dwarf.Tag;
    @:native("TagCatchDwarfBlock") static final tagCatchDwarfBlock: go.debug.dwarf.Tag;
    @:native("TagClassType") static final tagClassType: go.debug.dwarf.Tag;
    @:native("TagCoarrayType") static final tagCoarrayType: go.debug.dwarf.Tag;
    @:native("TagCommonDwarfBlock") static final tagCommonDwarfBlock: go.debug.dwarf.Tag;
    @:native("TagCommonInclusion") static final tagCommonInclusion: go.debug.dwarf.Tag;
    @:native("TagCompileUnit") static final tagCompileUnit: go.debug.dwarf.Tag;
    @:native("TagCondition") static final tagCondition: go.debug.dwarf.Tag;
    @:native("TagConstType") static final tagConstType: go.debug.dwarf.Tag;
    @:native("TagConstant") static final tagConstant: go.debug.dwarf.Tag;
    @:native("TagDwarfProcedure") static final tagDwarfProcedure: go.debug.dwarf.Tag;
    @:native("TagDynamicType") static final tagDynamicType: go.debug.dwarf.Tag;
    @:native("TagEntryPoint") static final tagEntryPoint: go.debug.dwarf.Tag;
    @:native("TagEnumerationType") static final tagEnumerationType: go.debug.dwarf.Tag;
    @:native("TagEnumerator") static final tagEnumerator: go.debug.dwarf.Tag;
    @:native("TagFileType") static final tagFileType: go.debug.dwarf.Tag;
    @:native("TagFormalParameter") static final tagFormalParameter: go.debug.dwarf.Tag;
    @:native("TagFriend") static final tagFriend: go.debug.dwarf.Tag;
    @:native("TagGenericSubrange") static final tagGenericSubrange: go.debug.dwarf.Tag;
    @:native("TagImmutableType") static final tagImmutableType: go.debug.dwarf.Tag;
    @:native("TagImportedDeclaration") static final tagImportedDeclaration: go.debug.dwarf.Tag;
    @:native("TagImportedModule") static final tagImportedModule: go.debug.dwarf.Tag;
    @:native("TagImportedUnit") static final tagImportedUnit: go.debug.dwarf.Tag;
    @:native("TagInheritance") static final tagInheritance: go.debug.dwarf.Tag;
    @:native("TagInlinedSubroutine") static final tagInlinedSubroutine: go.debug.dwarf.Tag;
    @:native("TagInterfaceType") static final tagInterfaceType: go.debug.dwarf.Tag;
    @:native("TagLabel") static final tagLabel: go.debug.dwarf.Tag;
    @:native("TagLexDwarfBlock") static final tagLexDwarfBlock: go.debug.dwarf.Tag;
    @:native("TagMember") static final tagMember: go.debug.dwarf.Tag;
    @:native("TagModule") static final tagModule: go.debug.dwarf.Tag;
    @:native("TagMutableType") static final tagMutableType: go.debug.dwarf.Tag;
    @:native("TagNamelist") static final tagNamelist: go.debug.dwarf.Tag;
    @:native("TagNamelistItem") static final tagNamelistItem: go.debug.dwarf.Tag;
    @:native("TagNamespace") static final tagNamespace: go.debug.dwarf.Tag;
    @:native("TagPackedType") static final tagPackedType: go.debug.dwarf.Tag;
    @:native("TagPartialUnit") static final tagPartialUnit: go.debug.dwarf.Tag;
    @:native("TagPointerType") static final tagPointerType: go.debug.dwarf.Tag;
    @:native("TagPtrToMemberType") static final tagPtrToMemberType: go.debug.dwarf.Tag;
    @:native("TagReferenceType") static final tagReferenceType: go.debug.dwarf.Tag;
    @:native("TagRestrictType") static final tagRestrictType: go.debug.dwarf.Tag;
    @:native("TagRvalueReferenceType") static final tagRvalueReferenceType: go.debug.dwarf.Tag;
    @:native("TagSetType") static final tagSetType: go.debug.dwarf.Tag;
    @:native("TagSharedType") static final tagSharedType: go.debug.dwarf.Tag;
    @:native("TagSkeletonUnit") static final tagSkeletonUnit: go.debug.dwarf.Tag;
    @:native("TagStringType") static final tagStringType: go.debug.dwarf.Tag;
    @:native("TagStructType") static final tagStructType: go.debug.dwarf.Tag;
    @:native("TagSubprogram") static final tagSubprogram: go.debug.dwarf.Tag;
    @:native("TagSubrangeType") static final tagSubrangeType: go.debug.dwarf.Tag;
    @:native("TagSubroutineType") static final tagSubroutineType: go.debug.dwarf.Tag;
    @:native("TagTemplateAlias") static final tagTemplateAlias: go.debug.dwarf.Tag;
    @:native("TagTemplateTypeParameter") static final tagTemplateTypeParameter: go.debug.dwarf.Tag;
    @:native("TagTemplateValueParameter") static final tagTemplateValueParameter: go.debug.dwarf.Tag;
    @:native("TagThrownType") static final tagThrownType: go.debug.dwarf.Tag;
    @:native("TagTryDwarfBlock") static final tagTryDwarfBlock: go.debug.dwarf.Tag;
    @:native("TagTypeUnit") static final tagTypeUnit: go.debug.dwarf.Tag;
    @:native("TagTypedef") static final tagTypedef: go.debug.dwarf.Tag;
    @:native("TagUnionType") static final tagUnionType: go.debug.dwarf.Tag;
    @:native("TagUnspecifiedParameters") static final tagUnspecifiedParameters: go.debug.dwarf.Tag;
    @:native("TagUnspecifiedType") static final tagUnspecifiedType: go.debug.dwarf.Tag;
    @:native("TagVariable") static final tagVariable: go.debug.dwarf.Tag;
    @:native("TagVariant") static final tagVariant: go.debug.dwarf.Tag;
    @:native("TagVariantPart") static final tagVariantPart: go.debug.dwarf.Tag;
    @:native("TagVolatileType") static final tagVolatileType: go.debug.dwarf.Tag;
    @:native("TagWithStmt") static final tagWithStmt: go.debug.dwarf.Tag;

    /**
        New returns a new [Data] object initialized from the given parameters.
        Rather than calling this function directly, clients should typically use
        the DWARF method of the File type of the appropriate package [debug/elf],
        [debug/macho], or [debug/pe].
        
        The []byte arguments are the data from the corresponding debug section
        in the object file; for example, for an ELF object, abbrev is the contents of
        the ".debug_abbrev" section.
    **/
    @:native("New") static function _new(abbrev: go.Slice<go.Byte>, aranges: go.Slice<go.Byte>, frame: go.Slice<go.Byte>, info: go.Slice<go.Byte>, line: go.Slice<go.Byte>, pubnames: go.Slice<go.Byte>, ranges: go.Slice<go.Byte>, str: go.Slice<go.Byte>): (go.Result<go.Pointer<go.debug.dwarf.Data>>);

}