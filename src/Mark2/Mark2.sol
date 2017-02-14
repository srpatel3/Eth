contract Mark2{
    uint counter;
    struct list{
        string typo;
        address addr;
        bool exists;
    }
    mapping (string => list) _list;
    struct node{
        address add;
        address next;
        address head;
    }

    mapping (string =>mapping(address=>node)) _node;

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
            counter--;
        }
    }
    function getCounter() constant returns(uint){
        return counter;
    }
    function getData(string _typo, address _add) constant returns(string, address){
        return (_list[_typo].typo, _node[_typo][_add].add );
    }
}
