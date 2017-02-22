contract Y{
    string head;
    struct Temp{
        string next;
        string current;
    }
    mapping (string => Temp) _temp;
    function test(){
    _temp['root'].next = 'null';
    _temp['root'].current = 'null';
    head = 'root';
    }
    function addNodes(string _current){
        _temp[_current].current = _current;
        _temp[_current].next = head;
        head = _current;
    }

    function getNodes(string _current) constant returns (string){
        string memory concat_String = strConcat('something','helps');
        return concat_String;
    }
    function strConcat(string _a, string _b) internal returns (string){
        string memory tempo1 = ';';
        bytes memory _ba = bytes(_a);
        bytes memory _bb = bytes(_b);
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

https://ethereum.github.io/browser-solidity/#version=soljson-v0.4.9+commit.364da425.js
