package go.go.token;

@:structInit
@:go.Type({ name: "File", instanceName: "token.File", imports: ["go/token"] })
extern class File {

    @:native("AddLine") function addLine(offset: go.GoInt): Void;
    @:native("AddLineColumnInfo") function addLineColumnInfo(offset: go.GoInt, filename: String, line: go.GoInt, column: go.GoInt): Void;
    @:native("AddLineInfo") function addLineInfo(offset: go.GoInt, filename: String, line: go.GoInt): Void;
    @:native("Base") function base(): (go.GoInt);
    @:native("End") function end(): (go.go.token.Pos);
    @:native("Line") function line(p: go.go.token.Pos): (go.GoInt);
    @:native("LineCount") function lineCount(): (go.GoInt);
    @:native("LineStart") function lineStart(line: go.GoInt): (go.go.token.Pos);
    @:native("Lines") function lines(): (go.Slice<go.GoInt>);
    @:native("MergeLine") function mergeLine(line: go.GoInt): Void;
    @:native("Name") function name(): (String);
    @:native("Offset") function offset(p: go.go.token.Pos): (go.GoInt);
    @:native("Pos") function pos(offset: go.GoInt): (go.go.token.Pos);
    @:native("Position") function position(p: go.go.token.Pos): (go.go.token.Position);
    @:native("PositionFor") function positionFor(p: go.go.token.Pos, adjusted: Bool): (go.go.token.Position);
    @:native("SetLines") function setLines(lines: go.Slice<go.GoInt>): (Bool);
    @:native("SetLinesForContent") function setLinesForContent(content: go.Slice<go.Byte>): Void;
    @:native("Size") function size(): (go.GoInt);

}