package unit;

import haxe.Serializer;
import haxe.Unserializer;

function main() {
	var cl = getClassData();
	var sz = Serializer.run(cl);
	assert(sz != null);
	var decoded = Unserializer.run(sz);
	assert(decoded != null);
	assert(decoded.path == "unit._Rtti2.RttiClass1");
	assert(decoded.statics[0].name == "v");
	assert(decoded.fields[0].name == "f");
}

// this function returns RTTI type class information for testing purposes
function getClassData() {
	var xmltext = "\t<class path=\"unit._Rtti2.RttiClass1\" params=\"\" file=\"tests/unit/Rtti2.hx\" private=\"1\" module=\"unit.Rtti2\">\n\t\t<__rtti public=\"1\" line=\"113\" static=\"1\"><c path=\"String\"/></__rtti>\n\t\t<v static=\"1\"><c path=\"String\"/></v>\n\t\t<f public=\"1\" set=\"method\" line=\"116\"><f a=\"\"><x path=\"Float\"/></f></f>\n\t\t<meta>\n\t\t\t<m n=\":directlyUsed\"/>\n\t\t\t<m n=\":rtti\"/>\n\t\t\t<m n=\":keepSub\"/>\n\t\t</meta>\n\t</class>\n";
	var xml = Xml.parse(xmltext);
	var cl = xml.firstElement();
	var infos = new haxe.rtti.XmlParser().processElement(cl);
	switch (infos) {
		case TClassdecl(c):
			// remove static field __rtti if it exists
			c.statics = c.statics.filter(f -> f.name != "__rtti");
			// tidy up the platforms for static and instance fields
			for (i in 0...c.statics.length)
				c.statics[i].platforms = [];
			for (i in 0...c.fields.length)
				c.fields[i].platforms = [];
			return c;
		case var t:
	}
	return null;
}
