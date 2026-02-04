function main() {
	TestAll.init();
	trace(TestAll.cyan("=== hx2go Tests ===\n"));
	MacroTest.runTests("*", {
		unit.Unit.main();
	});
	TestAll.end();
}
