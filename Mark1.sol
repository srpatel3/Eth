contract LLMapping{
  //structure information
  struct node{
    address addr; string next;
  }
  mapping(string => node) nodes;
  string head;

  //constructor
  function LLMapping() {
    head = 'root';
    nodes['root'].next = 'root';
    nodes['root'].addr = 0;
  }

  //function for adding elements to linked list
  function add(string _name, address _addr){
    nodes[_name].next = head;
    nodes[_name].addr = _addr;
    head = _name;
  }

function greet() constant returns (string,string,address){
    return (head,nodes['root'].next,nodes['roots'].addr);
}
function stringsEqual(string _a, string _b) internal returns (bool) {
		bytes memory a = bytes(_a);
		bytes  memory b = bytes(_b);
		if (a.length != b.length)
			return false;
		// @todo unroll this loop
		for (uint i = 0; i < a.length; i ++)
			if (a[i] != b[i])
				return false;
		return true;
	}



  //function for iteration

   function iterate() constant returns (uint){
    uint count = 0;
    string name;
    for(name = head; stringsEqual(name,head);name = nodes[name].next){
      count++;
    }
    return count;
  }

}
