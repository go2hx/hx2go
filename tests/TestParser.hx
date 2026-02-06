function main() {
	TestAll.init();
	trace(TestAll.cyan("=== hx2go Tests ===\n"));
	MacroTest.runTests("*", {
		exprparser.ExprParser.main();
	});
	TestAll.end();
}
