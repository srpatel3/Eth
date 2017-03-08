contract X {

  string public returnList;

  struct list{
       string typo;  // name of dataset
       address head; //will be the lastIndex of that perticular list
       address lastIndex; //still haven't figured out a function for this variable
   }

  //address temp;
  mapping (string => list) _list;
  
//need to add reputation field in the struct 
  struct node{
     address add; //address of that producer
     address next; //next producer in the list
     string name; //name of the producer
     uint account; //account information now I still need to make change in this for making tockens
     string IP; //IP of the dataset
    // bool isExist;
  }


  mapping (string =>mapping(address=>node)) _node; //mapping for producer list


  function makeNewDataset(string _typo){ //adds dataset to list
      addToList(_typo);
  }
    
    
    
  function addSeller1(string _typo,address _addr){ //adds some information of producer to list
      addToNodes(_typo);
  }

    function addSeller2(string _typo, string _name, string _ip, uint _account){ //adds remaining information of seller to list
        addOtherData(_typo, _name, _ip, _account);
    }

  
 
 //-------------------Implementation of functions-----------------------------//
 
   function addToList(string _typo){
    _list[_typo].typo = _typo;
    _list[_typo].head = 0;
  }
  
  function modifyData(string _typo,string _name, string _ip,uint _account){
        if(_node[_typo][msg.sender].add!=0){
            //address addr = msg.sender;
            //_node[_typo][addr].name = _name;
            //_node[_typo][addr].IP = _ip;
            //_node[_typo][addr].account = _account;
            addOtherData(_typo,_name,_ip,_account);
        }
        else
            returnList = "Does not Exist";
    }
    
     function addToNodes(string _typo){
    address _addr = msg.sender;
    _node[_typo][_addr].next = _list[_typo].head;
    _node[_typo][_addr].add =_addr;
    _list[_typo].head = _addr;
    

  }
  
   function addOtherData(string _typo, string _name,string _ip,uint _account){
        address _addr = msg.sender;
      _node[_typo][_addr].name = _name;
      _node[_typo][_addr].IP = _ip;
      //_node[_typo][_addr].isExist = true;
      _node[_typo][_addr].account = _account;
      
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

    function testmodifyData() constant returns(string){
        return returnList;
    }
    function getHead(string _typo) constant returns(address){
        return (_list[_typo].head);
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
  function getInfo(string _typo, address _addr) constant returns(address , address, string, string,string,uint){
      return (_node[_typo][_addr].next,_node[_typo][_addr].add,_list[_typo].typo, 
_node[_typo][_addr].name,_node[_typo][_addr].IP,_node[_typo][_addr].account);
  }


}

