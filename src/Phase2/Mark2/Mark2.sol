//still need to work on the function calling from different contract thing to make sure if I can assign values in a single transaction.

contract B{
    
    modifier isValidTomakeTransaction(address _toAddr,address _fromAddr){
          if (_toAddr == _fromAddr) throw;
        _;
    }
    
    
}



contract A is B{
    struct Node{
        //address addr;
        //string IP;
        string name;
        uint account;
        uint reputation;
        uint counterForGoodReputation;
        uint counterForBadReputation;
        mapping(uint => TrackGoodReps) _gReps;
        mapping(uint => TrackBadReps) _bReps;
    }
    struct TrackGoodReps{
        address Address;
    }
    
    struct TrackBadReps{
        address Address;
    }

    
    mapping (string =>mapping(address=>Node)) _node;
    
    function buyInformation(string _name, address _toAddress, address fromAddress) {
        if(_node[_name][fromAddress].account>100){
            _node[_name][fromAddress].account -= 50;
            _node[_name][_toAddress].account += 50;
        }
        
    }

    function giveGoodReps(string _name,address _toAddress,address _fromAddress) isValidTomakeTransaction(_toAddress,_fromAddress){
        _node[_name][_toAddress].reputation += 5;
        _node[_name][_toAddress]._gReps[_node[_name][_toAddress].counterForGoodReputation].Address = _fromAddress;
        _node[_name][_toAddress].counterForGoodReputation++;
        //if(_node[_name][_toAddress].counterForGoodReputation>1){
        //    Iterate(_name,_toAddress);
    //    }
    }
    
    
    function Iterate(string _name,address _addr){
        for(uint i=0;i<_node[_name][_addr].counterForGoodReputation;i++){
            _node[_name][_node[_name][_addr]._gReps[i].Address].reputation +=1;
        }        
    }
    
    function giveBadReps(string _name,address _toAddress, address _fromAddress) isValidTomakeTransaction(_toAddress, _fromAddress){
        _node[_name][_fromAddress].reputation -= 5;
    }
    
    function addData(string _name,address _addr){
        //address _addr = msg.sender;
        //_node[_name][_addr].addr = _addr;
        //_node[_name][_addr].IP = _ip;
        _node[_name][_addr].name = _name;
        _node[_name][_addr].account = 50;
        _node[_name][_addr].reputation = 0;
        _node[_name][_addr].counterForGoodReputation = 0;
        _node[_name][_addr].counterForBadReputation = 0;
    }
    
    function getInfo(string _name,address _addr) constant returns(string, uint, uint, uint){
        return (_node[_name][_addr].name , _node[_name][_addr].account, 
_node[_name][_addr].reputation,_node[_name][_addr].counterForGoodReputation);
    }
}


