pragma solidity ^0.4.9;
contract Mark2{
    uint public counter;
    struct list{
        string typo;  // name of dataset
        address head; // seller address
        bool exists;  // does this bucket contain valid data?
    }

    mapping (string => list) _list;

    struct node{
        address add;
        address next;  // can next == 0x00000000000000000000000000  ?
    }

    mapping (string =>mapping(address=>node)) _node;
    //node[][] _nodes;

    function Mark2(){
        _node['root'][6].add = 6;
        _node['shirish'][5].add = 5;
        _list['shirish'].typo = 'shirish';
        _list['root'].typo = 'something';
        counter = 3;
    }

    function getData(string _typo, address _add) constant returns(string, address){
        return (_list[_typo].typo, _node[_typo][_add].add );
    }

    function add(string _typo1,address _addr){
        string memory _typo = _typo1;
        address addr = _addr;
            addToList(_typo1);
            addToNodes(_typo , _addr);

    }

    function addToList(string _typo){
        _list[_typo].typo = _typo;
    }

    function addToNodes(string _typo,address _addr){

        _node[_typo][_addr].next = _addr;
        //_list[_typo].typo = _typo;
        _node[_typo][_addr].add =_addr;

    }

    function iterate(string _typo) constant returns(uint){
        //uint count = 0;
        string memory name;
        address _addr;
        uint count = 0;
        //if(stringsEqual("shirish","shirish"))
        //   count = 6;
        //for(uint i=0;i<5;i++)
        //   counter++;
        for( _addr = _list[_typo].head;_addr!=0 ;_addr = _node[_typo][_addr].next){
            count++;
        }
        return count;
    }

    function getCounter() constant returns(uint){
        return counter;
    }



}
/*#     function addbyDSName(node n){
#
#         if(!_list[n.typo].exists){
#             _list[n.typo].typo = _keyword;
#             _list[n.typo].exists = true;
#             _list[n.typo].addr = 0;
#             counter++;
#         }
#         else{
#             // here we add a new list node. Maybe also check
#             // for a matching existing list node?
#             counter--;
#         }
#     }


// not needed yet
#     function addbyKeyword(node n){
#
#         if(!_list[n.keyword].exists){
#             _list[n.keyword].typo = _keyword;
#             _list[n.keyword].exists = true;
#             _list[n.keyword].addr = 0;
#             counter++;
#         }
#         else{
#             // here we add a new list node. Maybe also check
#             // for a matching existing list node?
#             counter--;
#         }
#     }

*/
  //  function lookupByDSName(string dsname) constant returns(node []) {

    //}

// not needed yet
//88#     function lookupByKeyWord(string keyword) constant returns(node []) {/
//#
//#     }
