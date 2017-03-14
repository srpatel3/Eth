pragma solidity ^0.4.8;
contract X{
    
    //structure for maintainig the list of datasetNames and the last element in the list
    struct datasetList{
        string datasetName;
        address listHead;
        //address 
    }
    
    //will keep track of the ones who gave good reps.
    struct trackGoodReps{
        address Address;    
    }
    
    //will keep track of the ones who gave bad reps
    struct trackBadReps{
        address Address;
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
        uint datasetFeedBack;
        uint counterForGoodFeedBack;
        uint counterForBadFeedBack;
        mapping (uint => trackGoodReps) list_goodFeed;
        mapping (uint => trackBadReps) list_badFeed;
    }

    
    
    //will have the account information of the perticular seller from the sellerList
    struct sellerAccounts{
        uint accountBalance;
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
        list_Seller[_datasetName][msg.sender].counterForGoodFeedBack = 0;
        list_Seller[_datasetName][msg.sender].counterForBadFeedBack = 0;
        list_Seller[_datasetName][msg.sender].datasetFeedBack = 0;
        list_Dataset[_datasetName].listHead = msg.sender;
        list_Accounts[msg.sender].accountBalance += 50;
    }
    
    function buyInformation(string _datasetName, address _sellerAddress) constant returns(string){
        if(list_Accounts[msg.sender].accountBalance > list_Seller[_datasetName][_sellerAddress].cost){
            list_Accounts[msg.sender].accountBalance -= list_Seller[_datasetName][_sellerAddress].cost;
            list_Accounts[_sellerAddress].accountBalance += list_Seller[_datasetName][_sellerAddress].cost;
            return ("Something In URL");
        }
        else{
            return "Insufficient Account Balance";
        }
    }
    
    
    function giveGoodFeed(string _datasetName, address _sellerAddress){
        list_Seller[_datasetName][_sellerAddress].datasetFeedBack += 1;
        list_Seller[_datasetName][_sellerAddress].list_goodFeed[list_Seller[_datasetName][_sellerAddress].counterForGoodFeedBack].Address = msg.sender;
        list_Seller[_datasetName][_sellerAddress].counterForGoodFeedBack += 1;
    }
    
    function giveBadFeed(string _datasetName, address _sellerAddress){
        list_Seller[_datasetName][_sellerAddress].datasetFeedBack -= 1;
        list_Seller[_datasetName][_sellerAddress].list_badFeed[list_Seller[_datasetName][_sellerAddress].counterForBadFeedBack].Address = msg.sender;
        list_Seller[_datasetName][_sellerAddress].counterForBadFeedBack += 1;
    }
}

contract Y is X{
    
    function testaddNewDataset(string _datasetName) constant returns(string, string, string, string, uint, address){
        return (list_Seller[_datasetName][msg.sender].sellerName, list_Seller[_datasetName][msg.sender].IP, 
list_Seller[_datasetName][msg.sender].datasetLocation,list_Seller[_datasetName][msg.sender].datasetDescription,list_Seller[_datasetName][msg.sender].cost, 
list_Seller[_datasetName][msg.sender].next);
    }
    
    function testmakeNewDataset(string _datasetName) constant returns(string , address){
        return (list_Dataset[_datasetName].datasetName,list_Dataset[_datasetName].listHead);
    }
}




