describe("Output", function() {
    var testLinkId = 2;
    var testLink;
    var testOutput;

    beforeEach(function() {
	testLink = new window.sirius.Link({id: testLinkId});
	testOutput = new window.sirius.Output({link: testLink});
    });

    it("should not blow up on to_xml", function() {
	var doc = document.implementation.createDocument("document:xml", "begin", null);
	var out = testOutput.to_xml(doc); 
	expect(out).not.toBeNull();
    });

    it("should contain test link", function() {
	expect(testOutput.get('link')).toEqual(testLink);
    });

    it("should resolve link_id as link", function() {
	var b = new window.sirius.Output({link_id: testLinkId});
	var deferred = [];
	var object_with_id = { 'link': [] };
	object_with_id.link[testLinkId] = testLink;
	expect(b.get('link')).toBeUndefined();
	b.resolve_references(deferred, object_with_id);
	runDeferred(deferred);
	expect(b.get('link')).toEqual(testLink);
    });

    it("should encode link reference as link_id", function() {
	// should not contain link_id at first
	expect(testOutput.get('link_id')).toBeUndefined();
	testOutput.encode_references();
	expect(testOutput.get('link_id')).toEqual(testLinkId);
    })

});