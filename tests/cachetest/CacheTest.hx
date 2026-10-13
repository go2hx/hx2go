import hxb.HxbArchive;
import hxb.HxbModule;
import hx2go.Cache;
import sys.FileSystem;

function main() {
	var output = 'output/cachetest-${Std.random(0x3FFFFFFF)}';
	FileSystem.createDirectory(output);
	// empty module to test cache hits and misses
	var archive = HxbArchive.empty();
	var module = new HxbModule([], "Probe", "Probe.hx");

	function cache(enabled:Bool) return new Cache(enabled, output, []);

	// save a cache entry, then confirm a new cache instance can reuse it
	var initial = cache(true);
	if (initial.isHit("test", archive, module)) throw "Expected a cold cache miss";
	initial.save();
	if (!cache(true).isHit("test", archive, module)) throw "Expected a warm cache hit";

	// an uncached build can overwrite the output, so the old entry is no longer valid
	cache(false).save();

	// re-enabling the cache must miss instead of reusing stale output
	if (cache(true).isHit("test", archive, module))
		throw "Uncached build left a stale cache hit";

	Sys.println("PASS: uncached build invalidates previous cache entries");
}
