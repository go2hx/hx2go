package go.golang_org.x.tools.go.ast;

/**
    Package edge defines identifiers for each field of an ast.Node
    struct type that refers to another Node.
**/
@:go.Type({ name: "edge", instanceName: "edge.edge", imports: ["golang.org/x/tools/go/ast/edge"] })
extern class Edge {

    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("ArrayType_Elt") static final arrayType_Elt: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("ArrayType_Len") static final arrayType_Len: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("AssignStmt_Lhs") static final assignStmt_Lhs: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("AssignStmt_Rhs") static final assignStmt_Rhs: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("BinaryExpr_X") static final binaryExpr_X: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("BinaryExpr_Y") static final binaryExpr_Y: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("BlockStmt_List") static final blockStmt_List: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("BranchStmt_Label") static final branchStmt_Label: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("CallExpr_Args") static final callExpr_Args: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("CallExpr_Fun") static final callExpr_Fun: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("CaseClause_Body") static final caseClause_Body: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("CaseClause_List") static final caseClause_List: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("ChanType_Value") static final chanType_Value: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("CommClause_Body") static final commClause_Body: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("CommClause_Comm") static final commClause_Comm: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("CommentGroup_List") static final commentGroup_List: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("CompositeLit_Elts") static final compositeLit_Elts: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("CompositeLit_Type") static final compositeLit_Type: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("DeclStmt_Decl") static final declStmt_Decl: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("DeferStmt_Call") static final deferStmt_Call: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("Ellipsis_Elt") static final ellipsis_Elt: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("ExprStmt_X") static final exprStmt_X: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("FieldList_List") static final fieldList_List: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("Field_Comment") static final field_Comment: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("Field_Doc") static final field_Doc: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("Field_Names") static final field_Names: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("Field_Tag") static final field_Tag: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("Field_Type") static final field_Type: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("File_Decls") static final file_Decls: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("File_Doc") static final file_Doc: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("File_Name") static final file_Name: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("ForStmt_Body") static final forStmt_Body: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("ForStmt_Cond") static final forStmt_Cond: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("ForStmt_Init") static final forStmt_Init: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("ForStmt_Post") static final forStmt_Post: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("FuncDecl_Body") static final funcDecl_Body: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("FuncDecl_Doc") static final funcDecl_Doc: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("FuncDecl_Name") static final funcDecl_Name: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("FuncDecl_Recv") static final funcDecl_Recv: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("FuncDecl_Type") static final funcDecl_Type: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("FuncLit_Body") static final funcLit_Body: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("FuncLit_Type") static final funcLit_Type: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("FuncType_Params") static final funcType_Params: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("FuncType_Results") static final funcType_Results: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("FuncType_TypeParams") static final funcType_TypeParams: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("GenDecl_Doc") static final genDecl_Doc: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("GenDecl_Specs") static final genDecl_Specs: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("GoStmt_Call") static final goStmt_Call: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("IfStmt_Body") static final ifStmt_Body: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("IfStmt_Cond") static final ifStmt_Cond: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("IfStmt_Else") static final ifStmt_Else: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("IfStmt_Init") static final ifStmt_Init: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("ImportSpec_Comment") static final importSpec_Comment: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("ImportSpec_Doc") static final importSpec_Doc: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("ImportSpec_Name") static final importSpec_Name: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("ImportSpec_Path") static final importSpec_Path: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("IncDecStmt_X") static final incDecStmt_X: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("IndexExpr_Index") static final indexExpr_Index: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("IndexExpr_X") static final indexExpr_X: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("IndexListExpr_Indices") static final indexListExpr_Indices: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("IndexListExpr_X") static final indexListExpr_X: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("InterfaceType_Methods") static final interfaceType_Methods: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("Invalid") static final invalid: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("KeyValueExpr_Key") static final keyValueExpr_Key: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("KeyValueExpr_Value") static final keyValueExpr_Value: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("LabeledStmt_Label") static final labeledStmt_Label: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("LabeledStmt_Stmt") static final labeledStmt_Stmt: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("MapType_Key") static final mapType_Key: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("MapType_Value") static final mapType_Value: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("ParenExpr_X") static final parenExpr_X: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("RangeStmt_Body") static final rangeStmt_Body: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("RangeStmt_Key") static final rangeStmt_Key: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("RangeStmt_Value") static final rangeStmt_Value: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("RangeStmt_X") static final rangeStmt_X: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("ReturnStmt_Results") static final returnStmt_Results: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("SelectStmt_Body") static final selectStmt_Body: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("SelectorExpr_Sel") static final selectorExpr_Sel: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("SelectorExpr_X") static final selectorExpr_X: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("SendStmt_Chan") static final sendStmt_Chan: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("SendStmt_Value") static final sendStmt_Value: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("SliceExpr_High") static final sliceExpr_High: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("SliceExpr_Low") static final sliceExpr_Low: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("SliceExpr_Max") static final sliceExpr_Max: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("SliceExpr_X") static final sliceExpr_X: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("StarExpr_X") static final starExpr_X: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("StructType_Fields") static final structType_Fields: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("SwitchStmt_Body") static final switchStmt_Body: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("SwitchStmt_Init") static final switchStmt_Init: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("SwitchStmt_Tag") static final switchStmt_Tag: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("TypeAssertExpr_Type") static final typeAssertExpr_Type: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("TypeAssertExpr_X") static final typeAssertExpr_X: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("TypeSpec_Comment") static final typeSpec_Comment: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("TypeSpec_Doc") static final typeSpec_Doc: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("TypeSpec_Name") static final typeSpec_Name: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("TypeSpec_Type") static final typeSpec_Type: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("TypeSpec_TypeParams") static final typeSpec_TypeParams: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("TypeSwitchStmt_Assign") static final typeSwitchStmt_Assign: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("TypeSwitchStmt_Body") static final typeSwitchStmt_Body: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("TypeSwitchStmt_Init") static final typeSwitchStmt_Init: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("UnaryExpr_X") static final unaryExpr_X: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("ValueSpec_Comment") static final valueSpec_Comment: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("ValueSpec_Doc") static final valueSpec_Doc: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("ValueSpec_Names") static final valueSpec_Names: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("ValueSpec_Type") static final valueSpec_Type: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("ValueSpec_Values") static final valueSpec_Values: go.golang_org.x.tools.go.ast.edge.Kind;

}