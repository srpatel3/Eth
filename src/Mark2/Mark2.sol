contract Mark2{
    uint counter;
    struct list{
        string typo;  // name of dataset
        string keyword;
        address addr; // seller address
        bool exists;  // does this bucket contain valid data?
    }
    mapping (string => list) _list;
    struct node{
        address add;
        address next;  // can next == 0x00000000000000000000000000  ?
        address head;
    }

    mapping (string =>mapping(address=>node)) _node;

    address head = 0x0000;  //???

    function Mark2(){
        _node['root'][0].add = 1;
        _list['root'].typo = 'something';
        counter = 3;
    }

    function add(string _typo){

        if(!_list[_typo].exists){
            _list[_typo].typo = _typo;
            _list[_typo].exists = true;
            _list[_typo].addr = 0;
            counter++;
        }
        else{
            // here we add a new list node. Maybe also check
            // for a matching existing list node?
            counter--;
        }
    }


#     function addbyDSName(node n){
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


    function lookupByDSName(string dsname) constant returns(node []) {

    }

// not needed yet
#     function lookupByKeyWord(string keyword) constant returns(node []) {
#
#     }

    function getCounter() constant returns(uint){
        return counter;
    }
    function getData(string _typo, address _add) constant returns(string, address){
        return (_list[_typo].typo, _node[_typo][_add].add );
    }
}
