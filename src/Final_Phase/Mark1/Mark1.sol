contract X{
    
    //structure for maintainig the list of datasetNames and the last element in the list
    struct datasetList{
        string datasetName;
        address listHead;
        //address 
    }
    
    //Actual information of sellers will be stored in this lisr
    struct sellerList{
        string sellerName;
        address sellerAddress;
        address next;
        string IP;
        string datasetLocation;
        string datasetDescription;
        uint cost;
    }

    //will keep track of the ones who gave good reps.
    struct trackGoodReps{
        address Address;    
    }
    
    //will keep track of the ones who gave bad reps
    struct trackBadReps{
        address Address;
    }
    
    //will have the account information of the perticular seller from the sellerList
    struct sellerAccounts{
        uint accountBalance;
        uint sellerReputation;
        uint counterForGoodReputation;
        uint counterForBadReputation;
        mapping(uint => trackGoodReps) list_GoodReps;
        mapping(uint => trackBadReps) list_BadReps;
    }
    
    mapping (string => datasetList) list_Dataset; //mapping for datasetName
    mapping (string =>mapping(address=>sellerList)) list_Seller; //mapping for sellerList!!
    mapping (address=>sellerAccounts) list_Accounts;
    
    //you should be knowing what to so Shirish!!! Suck it up.
    function makeNewDataset(string _datasetName){
        list_Dataset[_datasetName].datasetName = _datasetName;
        list_Dataset[_datasetName].listHead = 0;
    }
    
    function addNewDataset(string _datasetName, string _sellerName, string _IP, string _datasetLocation, string _datasetDescription, uint _cost){
        list_Seller[_datasetName][msg.sender].sellerName = _sellerName;
        list_Seller[_datasetName][msg.sender].sellerAddress = msg.sender;
        list_Seller[_datasetName][msg.sender].IP = _IP;
        list_Seller[_datasetName][msg.sender].datasetLocation = _datasetLocation;
        list_Seller[_datasetName][msg.sender].datasetDescription = _datasetDescription;
        list_Seller[_datasetName][msg.sender].cost = _cost;
        list_Seller[_datasetName][msg.sender].next = list_Dataset[_datasetName].listHead;
        list_Dataset[_datasetName].listHead = msg.sender;
        list_Accounts[msg.sender].accountBalance += 50;
        list_Accounts[msg.sender].sellerReputation = 0;
        list_Accounts[msg.sender].counterForGoodReputation = 0;
        list_Accounts[msg.sender].counterForBadReputation = 0;
    }
    
    function buyInformation(string _datasetName, address _sellerAddress){
        if(list_Accounts[msg.sender].accountBalance > list_Seller[_datasetName][_sellerAddress].cost){
            
        }
    }
}

contract Y is X{
    
    function testaddNewDataset(string _datasetName) constant returns(string, string, string, string, uint, address){
        return (list_Seller[_datasetName][msg.sender].sellerName, list_Seller[_datasetName][msg.sender].IP, list_Seller[_datasetName][msg.sender].datasetLocation,list_Seller[_datasetName][msg.sender].datasetDescription,list_Seller[_datasetName][msg.sender].cost, list_Seller[_datasetName][msg.sender].next);
    }
    
    function testmakeNewDataset(string _datasetName) constant returns(string , address){
        return (list_Dataset[_datasetName].datasetName,list_Dataset[_datasetName].listHead);
    }
}