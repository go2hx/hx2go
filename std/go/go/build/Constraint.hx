package go.go.build;

/**
    Package constraint implements parsing and evaluation of build constraint lines.
    See https://golang.org/cmd/go/#hdr-Build_constraints for documentation about build constraints themselves.
    
    This package parses both the original “// +build” syntax and the “//go:build” syntax that was added in Go 1.17.
    See https://golang.org/design/draft-gobuild for details about the “//go:build” syntax.
**/
@:go.Type({ name: "constraint", instanceName: "constraint.constraint", imports: ["go/build/constraint"] })
extern class Constraint {

    /**
        GoVersion returns the minimum Go version implied by a given build expression.
        If the expression can be satisfied without any Go version tags, GoVersion returns an empty string.
        
        For example:
        
        	GoVersion(linux && go1.22) = "go1.22"
        	GoVersion((linux && go1.22) || (windows && go1.20)) = "go1.20" => go1.20
        	GoVersion(linux) = ""
        	GoVersion(linux || (windows && go1.22)) = ""
        	GoVersion(!go1.22) = ""
        
        GoVersion assumes that any tag or negated tag may independently be true,
        so that its analysis can be purely structural, without SAT solving.
        “Impossible” subexpressions may therefore affect the result.
        
        For example:
        
        	GoVersion((linux && !linux && go1.20) || go1.21) = "go1.20"
    **/
    @:native("GoVersion") static function goVersion(x: go.go.build.constraint.Expr): (String);
    /**
        IsGoBuild reports whether the line of text is a “//go:build” constraint.
        It only checks the prefix of the text, not that the expression itself parses.
    **/
    @:native("IsGoBuild") static function isGoBuild(line: String): (Bool);
    /**
        IsPlusBuild reports whether the line of text is a “// +build” constraint.
        It only checks the prefix of the text, not that the expression itself parses.
    **/
    @:native("IsPlusBuild") static function isPlusBuild(line: String): (Bool);
    /**
        Parse parses a single build constraint line of the form “//go:build ...” or “// +build ...”
        and returns the corresponding boolean expression.
    **/
    @:native("Parse") static function parse(line: String): (go.Result<go.go.build.constraint.Expr>);
    /**
        PlusBuildLines returns a sequence of “// +build” lines that evaluate to the build expression x.
        If the expression is too complex to convert directly to “// +build” lines, PlusBuildLines returns an error.
    **/
    @:native("PlusBuildLines") static function plusBuildLines(x: go.go.build.constraint.Expr): (go.Result<go.Slice<String>>);

}