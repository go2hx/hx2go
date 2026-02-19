function main() {
	TestAll.init();
	trace(TestAll.cyan("=== hx2go Tests ===\n"));
	MacroTest.runTests("*", {
		language.Language.main();
	});
	TestAll.end();
}
