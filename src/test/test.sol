contract Y{
    string head;
    struct Temp{
        address addr;
        string next;
        string current;
    }
    //mapping (address => Temp)_tempbyAdd;
    mapping (string => Temp) _temp;
    function Y(){
        _temp['root'].addr = 45;
        _temp['root'].next = 'root';
        _temp['root'].current = 'root';
        head = 'root';
    }
    function addNodes(string _current, address _addr){
        string memory _curr = _current;
        _temp[_current].current = _curr;
        _temp[_current].next = head;
        _temp[_current].addr = _addr;
        head = _curr;
    }
    //function getByAdd(address _add)constant returns(string,string,address){
    //    return (_tempbyAdd[_add].next,_tempbyAdd[_add].current,_tempbyAdd[_add].addr);
//    }
    
    function getHead() constant returns(string){
        return head;
    }
    
    function getNodes(string _current) constant returns (string,string,address){
        string temp1 = _temp[_current].next;
        address _addr = _temp[_current].addr;
        string temp2 = _temp[_current].current;
        //return temp2;
        return (temp1,temp2,_addr);
    }
    function getAdd(string _current) constant returns(address){
        address _addr = _temp[_current].addr;
        return _addr;
    }
    function toBytes(address x) returns (string) {
    bytes memory b = new bytes(20);
    for (uint i = 0; i < 20; i++)
        b[i] = byte(uint8(uint(x) / (2**(8*(19 - i)))));
    return string(b);
    }

    
    function strConcat(string _a, string _b) internal returns (string){
        string memory tempo1 = ';';
        bytes memory _ba = bytes(_a);
        bytes  memory _bb = bytes(_b);
        bytes memory tempo = bytes(tempo1);
        string memory abcde = new string(_ba.length + _bb.length + tempo.length);
        bytes memory babcde = bytes(abcde);
        uint k = 0;
        for (uint i = 0; i < _ba.length; i++) babcde[k++] = _ba[i];
        for (i = 0; i < tempo.length; i++) babcde[k++] = tempo[i];
        for (i = 0; i < _bb.length; i++) babcde[k++] = _bb[i];
    
    return string(babcde);
    }
}

