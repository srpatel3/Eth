contract X {

  struct list{
       string typo;  // name of dataset
       address head;
   }

  //address temp;
  mapping (string => list) _list;

  struct node{
     address add;
     address next;
     string name;
     uint account;
     string IP;
  }

  mapping (string =>mapping(address=>node)) _node;


  function makeNewDataset(string _typo){
      addToList(_typo);
  }

  function addSeller(string _typo,address _addr){
      addToNodes(_typo,_addr);
  }
  function add(string _typo1,address _addr){
        address temp = _addr;
    //    addToList(_typo1);
        addToNodes(_typo1 , _addr);
    //    _list[_typo1].head = temp;
  }

  function addToList(string _typo){
    _list[_typo].typo = _typo;
    _list[_typo].head = 0;
  }

  function addToNodes(string _typo,address _addr){

    _node[_typo][_addr].next = _list[_typo].head;
    _node[_typo][_addr].add =_addr;
    _list[_typo].head = _addr;

  }

  function Iterate(string _typo) constant returns (uint){
      address add1 = _list[_typo].head;
      uint count = 0;
      for( address _addr = add1; _addr!=0 ; _addr = _node[_typo][_addr].next){
            count++;
        }
      return count;
  }

  function testmakeNewDataset(string _typo) constant returns(string ,address){
      return (_list[_typo].typo, _list[_typo].head);
  }

  function testaddSeller(string _typo,address _addr)constant returns(address,address){
      return (_node[_typo][_addr].add,_node[_typo][_addr].next);
  }


  function getInfo(string _typo, address _addr) constant returns(string , address , address){
      return (_list[_typo].typo,_node[_typo][_addr].next,_node[_typo][_addr].add);
  }


}
