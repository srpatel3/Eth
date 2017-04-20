//to do work list
//1. Have to test implemented functions in the morning
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
      int datasetFeedBack; //will have to come with the final function
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
      int sellerReputation;
      uint numberOfFeeds;
    }

//----------------------------------------------------------------------------------------


    //mappings for different structures
    mapping (string => type_dataset) list_datasetType;
    mapping (string => mapping(address=>datasetNode_info))list_datasetInfo;
    mapping (string => mapping (address => datasetNode_qos)) list_datasetQos;
    mapping (address => sellerAccounts) list_Accounts;

//---------------------------------------------------------------------------------------

    //function implementations starts


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

    //for adding infomration to the dataset
    //still need to implement next one method
    function addDatasetInfo(string _datasetType, string _IP, string _datasetLocation, string _datasetDescription, string _encryptedURL, 
uint _cost){
        list_datasetInfo[_datasetType][msg.sender].IP = _IP;
        list_datasetInfo[_datasetType][msg.sender].datasetLocation = _datasetLocation;
        list_datasetInfo[_datasetType][msg.sender].datasetDescription = _datasetDescription;
        list_datasetInfo[_datasetType][msg.sender].encryptedURL = _encryptedURL;
        list_datasetInfo[_datasetType][msg.sender].cost = _cost;
        list_datasetInfo[_datasetType][msg.sender].owner = msg.sender;
        list_datasetInfo[_datasetType][msg.sender].next = list_datasetType[_datasetType].listHead;
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
    function addDataset(string _datasetType, string _IP, string _datasetLocation, string _datasetDescription, string _encryptedURL, uint 
_cost, 
uint volume){
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

    //helper function for giveFeeds
    function calcMul() returns (int){
        if(list_Accounts[msg.sender].numberOfFeeds>0){ //this will certain number in actual implementation
            if(list_Accounts[msg.sender].sellerReputation == 1){ //will be bounded by certain amount
                return 1;
            }
            else if(list_Accounts[msg.sender].sellerReputation == 2){
                return 2;
            }
            else if(list_Accounts[msg.sender].sellerReputation == -1){
                return -1;
            }
            else if(list_Accounts[msg.sender].sellerReputation == -2){
                return -2;
            }
            else{
                return 0;
            }
        } 
        else{
            return 0;
        }
    }
    
    function countFeed(int multiplier,int Feed) returns (int){
        if(multiplier == 0){
            return Feed;
        }
        else if(multiplier == 1 && Feed > 0){
            return Feed + multiplier;
        }
        else if(multiplier == 2 && Feed > 0){
            return Feed + multiplier;
        }
        else if(multiplier == 1 && Feed < 0){
            return Feed - multiplier;
        }
        else if(multiplier == 2 && Feed < 0){
            return Feed - multiplier;
        }
        else if(multiplier == -1 && Feed > 0){
            if(Feed + multiplier > 0){
                return (Feed + multiplier);
            }
            else {
                return 0;
            }
        }
        else if(multiplier == -2 && Feed > 0){
            if(Feed + multiplier > 0){
                return (Feed + multiplier);
            }
            else{
                return 0;
            }
        }
        else if(multiplier == -1 && Feed < 0){
            if(Feed - multiplier < 0){
                return (Feed - multiplier);
            }
            else {
                return 0;
            }
        }
        else if(multiplier == -2 && Feed < 0){
            if(Feed - multiplier < 0){
                return (Feed - multiplier);
            }
            else{
                return 0;
            }
        }
    }
    
    //for giving feedback for Datasets
    function giveFeeds(string _datasetType,address _sellerAddress, int feeds){
        int multiplier = calcMul();
        int calculatedFeeds = countFeed(multiplier, feeds);
        list_datasetQos[_datasetType][_sellerAddress].datasetFeedBack += calculatedFeeds;
        if(calculatedFeeds > 0){
            list_Accounts[_sellerAddress].sellerReputation += 1;
        }
        else{
            list_Accounts[_sellerAddress].sellerReputation -= 1;
        }
        list_Accounts[_sellerAddress].numberOfFeeds += 1;
    }
    
    function getDatasetInfo(string _datasetType)returns (string , string, string, string, uint, address, int){
        return (list_datasetInfo[_datasetType][msg.sender].IP,
                list_datasetInfo[_datasetType][msg.sender].datasetLocation,
                list_datasetInfo[_datasetType][msg.sender].datasetDescription,
                list_datasetInfo[_datasetType][msg.sender].encryptedURL,
                list_datasetInfo[_datasetType][msg.sender].cost,
                list_datasetInfo[_datasetType][msg.sender].owner,
                list_datasetQos[_datasetType][msg.sender].datasetFeedBack);
    }
    
    function something(){
        
    }
    function getAccountInfo() returns (string,address, uint , int, bool){
        return(list_Accounts[msg.sender].sellerName,
                list_Accounts[msg.sender].sellerAddress,
                list_Accounts[msg.sender].accountBalance,
                list_Accounts[msg.sender].sellerReputation, 
                list_Accounts[msg.sender].doesExist);
    }

    function getDatasetTypeInfo(string _datasetType) returns(string, address, bool){
        return (list_datasetType[_datasetType].datasetType, 
                list_datasetType[_datasetType].listHead, 
                list_datasetType[_datasetType].doesExist);
    }
    
}


