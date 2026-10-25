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
    @:native("ArrayType_Elt") static var arrayType_Elt: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("ArrayType_Len") static var arrayType_Len: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("AssignStmt_Lhs") static var assignStmt_Lhs: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("AssignStmt_Rhs") static var assignStmt_Rhs: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("BinaryExpr_X") static var binaryExpr_X: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("BinaryExpr_Y") static var binaryExpr_Y: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("BlockStmt_List") static var blockStmt_List: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("BranchStmt_Label") static var branchStmt_Label: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("CallExpr_Args") static var callExpr_Args: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("CallExpr_Fun") static var callExpr_Fun: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("CaseClause_Body") static var caseClause_Body: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("CaseClause_List") static var caseClause_List: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("ChanType_Value") static var chanType_Value: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("CommClause_Body") static var commClause_Body: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("CommClause_Comm") static var commClause_Comm: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("CommentGroup_List") static var commentGroup_List: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("CompositeLit_Elts") static var compositeLit_Elts: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("CompositeLit_Type") static var compositeLit_Type: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("DeclStmt_Decl") static var declStmt_Decl: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("DeferStmt_Call") static var deferStmt_Call: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("Ellipsis_Elt") static var ellipsis_Elt: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("ExprStmt_X") static var exprStmt_X: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("FieldList_List") static var fieldList_List: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("Field_Comment") static var field_Comment: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("Field_Doc") static var field_Doc: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("Field_Names") static var field_Names: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("Field_Tag") static var field_Tag: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("Field_Type") static var field_Type: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("File_Decls") static var file_Decls: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("File_Doc") static var file_Doc: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("File_Name") static var file_Name: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("ForStmt_Body") static var forStmt_Body: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("ForStmt_Cond") static var forStmt_Cond: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("ForStmt_Init") static var forStmt_Init: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("ForStmt_Post") static var forStmt_Post: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("FuncDecl_Body") static var funcDecl_Body: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("FuncDecl_Doc") static var funcDecl_Doc: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("FuncDecl_Name") static var funcDecl_Name: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("FuncDecl_Recv") static var funcDecl_Recv: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("FuncDecl_Type") static var funcDecl_Type: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("FuncLit_Body") static var funcLit_Body: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("FuncLit_Type") static var funcLit_Type: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("FuncType_Params") static var funcType_Params: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("FuncType_Results") static var funcType_Results: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("FuncType_TypeParams") static var funcType_TypeParams: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("GenDecl_Doc") static var genDecl_Doc: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("GenDecl_Specs") static var genDecl_Specs: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("GoStmt_Call") static var goStmt_Call: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("IfStmt_Body") static var ifStmt_Body: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("IfStmt_Cond") static var ifStmt_Cond: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("IfStmt_Else") static var ifStmt_Else: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("IfStmt_Init") static var ifStmt_Init: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("ImportSpec_Comment") static var importSpec_Comment: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("ImportSpec_Doc") static var importSpec_Doc: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("ImportSpec_Name") static var importSpec_Name: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("ImportSpec_Path") static var importSpec_Path: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("IncDecStmt_X") static var incDecStmt_X: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("IndexExpr_Index") static var indexExpr_Index: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("IndexExpr_X") static var indexExpr_X: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("IndexListExpr_Indices") static var indexListExpr_Indices: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("IndexListExpr_X") static var indexListExpr_X: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("InterfaceType_Methods") static var interfaceType_Methods: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("Invalid") static var invalid: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("KeyValueExpr_Key") static var keyValueExpr_Key: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("KeyValueExpr_Value") static var keyValueExpr_Value: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("LabeledStmt_Label") static var labeledStmt_Label: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("LabeledStmt_Stmt") static var labeledStmt_Stmt: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("MapType_Key") static var mapType_Key: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("MapType_Value") static var mapType_Value: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("ParenExpr_X") static var parenExpr_X: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("RangeStmt_Body") static var rangeStmt_Body: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("RangeStmt_Key") static var rangeStmt_Key: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("RangeStmt_Value") static var rangeStmt_Value: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("RangeStmt_X") static var rangeStmt_X: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("ReturnStmt_Results") static var returnStmt_Results: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("SelectStmt_Body") static var selectStmt_Body: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("SelectorExpr_Sel") static var selectorExpr_Sel: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("SelectorExpr_X") static var selectorExpr_X: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("SendStmt_Chan") static var sendStmt_Chan: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("SendStmt_Value") static var sendStmt_Value: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("SliceExpr_High") static var sliceExpr_High: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("SliceExpr_Low") static var sliceExpr_Low: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("SliceExpr_Max") static var sliceExpr_Max: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("SliceExpr_X") static var sliceExpr_X: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("StarExpr_X") static var starExpr_X: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("StructType_Fields") static var structType_Fields: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("SwitchStmt_Body") static var switchStmt_Body: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("SwitchStmt_Init") static var switchStmt_Init: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("SwitchStmt_Tag") static var switchStmt_Tag: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("TypeAssertExpr_Type") static var typeAssertExpr_Type: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("TypeAssertExpr_X") static var typeAssertExpr_X: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("TypeSpec_Comment") static var typeSpec_Comment: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("TypeSpec_Doc") static var typeSpec_Doc: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("TypeSpec_Name") static var typeSpec_Name: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("TypeSpec_Type") static var typeSpec_Type: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("TypeSpec_TypeParams") static var typeSpec_TypeParams: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("TypeSwitchStmt_Assign") static var typeSwitchStmt_Assign: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("TypeSwitchStmt_Body") static var typeSwitchStmt_Body: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("TypeSwitchStmt_Init") static var typeSwitchStmt_Init: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("UnaryExpr_X") static var unaryExpr_X: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("ValueSpec_Comment") static var valueSpec_Comment: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("ValueSpec_Doc") static var valueSpec_Doc: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("ValueSpec_Names") static var valueSpec_Names: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("ValueSpec_Type") static var valueSpec_Type: go.golang_org.x.tools.go.ast.edge.Kind;
    /**
        Each [Kind] is named Type_Field, where Type is the
        [ast.Node] struct type and Field is the name of the field
    **/
    @:native("ValueSpec_Values") static var valueSpec_Values: go.golang_org.x.tools.go.ast.edge.Kind;

}