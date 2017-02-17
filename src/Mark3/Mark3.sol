contract X {

  string public returnList;

  struct list{
       string typo;  // name of dataset
       address head;
       address lastIndex;
   }

  //address temp;
  mapping (string => list) _list;

  struct node{
     address add;
     address next;
    // string name;
    // uint account;
    // string IP;
  }


  mapping (string =>mapping(address=>node)) _node;


  function makeNewDataset(string _typo){
      addToList(_typo);
  }

  function addSeller(string _typo,address _addr){
      addToNodes(_typo,_addr);
  }

  function getList(string _typo){
      getNodes(_typo);
  }


//----------------------------------------------------------------------------------------//


  function strConcat(string _a, string _b, string _c, string _d, string _e) internal returns (string){
    bytes memory _ba = bytes(_a);
    bytes memory _bb = bytes(_b);
    bytes memory _bc = bytes(_c);
    bytes memory _bd = bytes(_d);
    bytes memory _be = bytes(_e);
    string memory abcde = new string(_ba.length + _bb.length + _bc.length + _bd.length + _be.length);
    bytes memory babcde = bytes(abcde);
    uint k = 0;
    for (uint i = 0; i < _ba.length; i++) babcde[k++] = _ba[i];
    for (i = 0; i < _bb.length; i++) babcde[k++] = _bb[i];
    for (i = 0; i < _bc.length; i++) babcde[k++] = _bc[i];
    for (i = 0; i < _bd.length; i++) babcde[k++] = _bd[i];
    for (i = 0; i < _be.length; i++) babcde[k++] = _be[i];
    return string(babcde);
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

  function getNodes(string _typo){

  }
//---------------------------------------------------------------------------------------//

  function Iterate(string _typo) constant returns (uint){
      address add1 = _list[_typo].head;
      uint count = 0;
      for( address _addr = add1; _addr!=0 ; _addr = _node[_typo][_addr].next){
            count++;
        }
      return count;
  }

//---------------------------------------------------------------------------------------//

   function teststrConcat() constant returns(string){
       string memory temp;
       temp = strConcat('my','name','is','shirish','patel');
       return temp;
   }

   function testgetList(string _typo)constant returns(string){
       return returnList;
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
