function main() {
	TestAll.init();
	trace(TestAll.cyan("=== hx2go Tests ===\n"));
	MacroTest.runTests("*", {
		issues.Issues.main();
	});
	TestAll.end();
}
