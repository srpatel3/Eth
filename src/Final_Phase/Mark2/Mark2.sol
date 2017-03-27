//to do work list
//1. Have to implement function for Seller reputation
//2. make seller reputations affect the feedbacks given to the dataset by that account.
//3. Try to join nodes using static script. 
pragma solidity ^0.4.8;

contract X{

    //declrataions of structures
    //mapping needs structures or contract types
    //can not map int to address type

    //structure for datasetType
    //each instance will represent different types of dataset

    struct type_dataset{
      string datasetType; //type of the dataset
      address listHead; //will point to the latest node added in list
      bool doesExist; //you know what it does
    }

    //this struct will have information of the nodes in the dataset
    //when I say information I meant information only
    //Not the QoS
    struct datasetNode_info{
      address next; //for maintaining list of datasets
      string IP; //useful for judginh network distance
      string datasetLocation; //country of origin
      string datasetDescription; //Free form metadata (can have some pattern)
      string encryptedURL; //this will be sent to buyer after payment
      uint cost; //cost of dataset not including network resources
      bool doesExist; //you know what it does
      uint volume; //volume of the dataset (has to be in KB format)
      address owner;//owner of this dataset
    }

    //struct for tracking feedback givers
    //will have to decide what to do with these guys later
    struct trackFeedbacks{
    address buyerAddress;
    }

    //this struct will have qos information about that perticular dataset
    struct datasetNode_qos{
      uint datasetFeedBack; //will have to come with the final function
      uint counterForGoodFeeds; //still have to decide about this
      uint counterForBadFeeds; //same here
      mapping (uint => trackFeedbacks) list_goodFeeds;
      mapping (uint => trackFeedbacks) list_badFeeds;
    }

    //will have information about the individual seller here
    struct sellerAccounts{
      string sellerName;
      address sellerAddress;
      uint accountBalance;
      bool doesExist;
      uint sellerReputation;
    }

//----------------------------------------------------------------------------------------


    //mappings for different structures
    mapping (string => type_dataset) list_datasetType;
    mapping (string => mapping(address=>datasetNode_info))list_datasetInfo;
    mapping (string => mapping (address => datasetNode_qos)) list_datasetQos;
    mapping (address => sellerAccounts) list_Accounts;

//---------------------------------------------------------------------------------------

    //function implementations starts


    //for adding new type of dataset
    function addDatasetType(string _datasetType) returns (string){
      if(list_datasetType[_datasetType].doesExist != true){
        list_datasetType[_datasetType].datasetType = _datasetType;
        list_datasetType[_datasetType].listHead = 0;
        list_datasetType[_datasetType].doesExist = true;
        return "new type successfully added";
      }
      else{
        return "dataset type already exist you can add dataset of this type";
      }
    }

    //this function will create new account for seller who wants to sell or publish dataset

    function createAccount(string _sellerName)returns (string){
        if(list_Accounts[msg.sender].doesExist!=true){
            list_Accounts[msg.sender].sellerName = _sellerName;
            list_Accounts[msg.sender].sellerAddress = msg.sender;
            list_Accounts[msg.sender].accountBalance = 0;
            list_Accounts[msg.sender].sellerReputation = 0;
            list_Accounts[msg.sender].doesExist = true;
            return "account successfully created";
        }
        else{
            return "account with address already exist";
        }
    }

    //for adding infomration to the dataset
    //still need to implement next one method
    function addDatasetInfo(string _datasetType, string _IP, string _datasetLocation, string _datasetDescription, string _encryptedURL, uint _cost){
        list_datasetInfo[_datasetType][msg.sender].IP = _IP;
        list_datasetInfo[_datasetType][msg.sender].datasetLocation = _datasetLocation;
        list_datasetInfo[_datasetType][msg.sender].datasetDescription = _datasetDescription;
        list_datasetInfo[_datasetType][msg.sender].encryptedURL = _encryptedURL;
        list_datasetInfo[_datasetType][msg.sender].cost = _cost;
        list_datasetInfo[_datasetType][msg.sender].owner = msg.sender;
    }

    //for adding QoS for dataset
    function addDatasetQos(string _datasetType){
        list_datasetQos[_datasetType][msg.sender].datasetFeedBack = 0;
        list_datasetQos[_datasetType][msg.sender].counterForGoodFeeds = 0;
        list_datasetQos[_datasetType][msg.sender].counterForBadFeeds = 0;
    }

    //for updating information of seller for this dataset
    function addSellerInfo(uint _volume) returns (uint){
        uint price;
        uint temp;
        temp = _volume/2;
        price += temp;
        temp = temp/2;
        price += temp;
        //price = (_volume/1000)*100+(_volume/100)*10+(_volume/1000)*1;
        list_Accounts[msg.sender].accountBalance += price;

        return price;
    }
    //this function will addNewdataset to the list
    //have to add conditions
    function addDataset(string _datasetType, string _IP, string _datasetLocation, string _datasetDescription, string _encryptedURL, uint _cost, uint volume){
        addDatasetInfo(_datasetType, _IP, _datasetLocation, _datasetDescription, _encryptedURL, _cost);
        addDatasetQos(_datasetType);
        addSellerInfo(volume);
    }

    //will modify members of dataset Information
    //need to decide to have function for each variable or just to have one function that modify each datamembers
    // I think it would be good to have individual functions for each data members
    function modifyDatatset(){

    }
    
    //function for buying dataset or I should say accessing dataset Information
    function buyDataset(string _datasetType, address _sellerAddress){
        if(list_Accounts[msg.sender].accountBalance>=list_datasetInfo[_datasetType][msg.sender].cost){
            list_Accounts[msg.sender].accountBalance -= list_datasetInfo[_datasetType][msg.sender].cost;
            list_Accounts[_sellerAddress].accountBalance += list_datasetInfo[_datasetType][msg.sender].cost;
        }
    }
}

//contract just for testing purpose
//will remove it once get done with coding
contract Y is X{


    function testaddDataset(string _datasetType)returns (string , string, string, string, uint, address, uint){
        return (list_datasetInfo[_datasetType][msg.sender].IP,
                list_datasetInfo[_datasetType][msg.sender].datasetLocation,
                list_datasetInfo[_datasetType][msg.sender].datasetDescription,
                list_datasetInfo[_datasetType][msg.sender].encryptedURL,
                list_datasetInfo[_datasetType][msg.sender].cost,
                list_datasetInfo[_datasetType][msg.sender].owner,
                list_datasetQos[_datasetType][msg.sender].datasetFeedBack);
    }
    function testCreateAccount() returns (string,address, uint , uint, bool){
        return(list_Accounts[msg.sender].sellerName,list_Accounts[msg.sender].sellerAddress,list_Accounts[msg.sender].accountBalance,
            list_Accounts[msg.sender].sellerReputation, list_Accounts[msg.sender].doesExist);
    }

    function testaddDatasetType(string _datasetType) returns(string, address, bool){
        return (list_datasetType[_datasetType].datasetType, list_datasetType[_datasetType].listHead, list_datasetType[_datasetType].doesExist);
    }

}
