contract LLMapping {
	//Accessor functions:
	//	LLMapping.nodes()
	//	LLMapping.nodes().addr
	//	LLMapping.nodes().next

	struct node {address addr; string32 next;}

	function LLMapping() {
		// Set up head node.
		head = 'root';
		nodes['root'].next = 'root';
		nodes['root'].addr = 0;
	}

	function add (string32 _name, address _addr) {
		// Add node to link list.
		// ! does not test for prior existance of node.
		nodes[_name].next = head;
		nodes[_name].addr = _addr;
		head = _name;
	}

	function iterate() {
		// Iterates through nodes performing some operation.
		for (name = head; name != 'root'; name = nodes[name].next) {
			// do something
		}

	mapping (string32 => node) public nodes; // string32 is name index. node contains address and next index.
	string32 head;
}
