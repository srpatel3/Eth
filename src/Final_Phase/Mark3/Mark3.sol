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
    
    //this struct  will keep track of the users who have used the dataset
    //will be helpful for improving Qos
    struct trackUsers{
        bool haveUsed;
    }
    
    //this struct will have qos information about that perticular dataset
    struct datasetNode_qos{
      int datasetFeedBack; //will have to come with the final function
      mapping(address => trackUsers) listOfUsers;
    }

    //will have information about the individual seller here
    struct userAccounts{
      string userName;
      address userAddress;
      uint accountBalance;
      bool doesExist;
      int userReputation;
      uint numberOfFeeds;
    }

//----------------------------------------------------------------------------------------


    //mappings for different structures
    mapping (string => type_dataset) list_datasetType;
    mapping (string => mapping(address=>datasetNode_info))list_datasetInfo;
    mapping (string => mapping (address => datasetNode_qos)) list_datasetQos;
    mapping (address => userAccounts) user_Accounts;

//---------------------------------------------------------------------------------------

    //function implementations starts


    //this function will create new account for seller who wants to sell or publish dataset
    function createAccount(string _sellerName)returns (string){
        if(user_Accounts[msg.sender].doesExist!=true){
            user_Accounts[msg.sender].userName = _sellerName;
            user_Accounts[msg.sender].userAddress = msg.sender;
            user_Accounts[msg.sender].accountBalance = 0;
            user_Accounts[msg.sender].userReputation = 0;
            user_Accounts[msg.sender].doesExist = true;
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
    function initDatasetQos(string _datasetType){
        list_datasetQos[_datasetType][msg.sender].datasetFeedBack = 0;
        //list_datasetQos[_datasetType][msg.sender].counterForGoodFeeds = 0;
        //list_datasetQos[_datasetType][msg.sender].counterForBadFeeds = 0;
    }

    //for updating information of seller for this dataset
    function addUserReward(uint _volume) returns (uint){
        uint price;
        uint temp;
        temp = _volume/2;
        price += temp;
        temp = temp/2;
        price += temp;
        //price = (_volume/1000)*100+(_volume/100)*10+(_volume/1000)*1;
       user_Accounts[msg.sender].accountBalance += price;

        return price;
    }
    //this function will addNewdataset to the list
    //have to add conditions
    function addDataset(string _datasetType, string _IP, string _datasetLocation, string _datasetDescription, string _encryptedURL, uint 
_cost, uint volume) constant returns (string){
    if(!list_datasetInfo[_datasetType][msg.sender].doesExist){
        addDatasetInfo(_datasetType, _IP, _datasetLocation, _datasetDescription, _encryptedURL, _cost);
        initDatasetQos(_datasetType);
        addUserReward(volume);
        return ("account successfully created");
    }
    else{
        return "dataset already exist!!";
    }
}

    //will modify members of dataset Information
    //need to decide to have function for each variable or just to have one function that modify each datamembers
    // I think it would be good to have individual functions for each data members
    function modifyDatatset(string _datasetType, string _IP, string _datasetLocation, string _datasetDescription, string _encryptedURL, 
uint 
_cost, uint volume) constant returns(string){
    if(list_datasetInfo[_datasetType][msg.sender].doesExist){
        addDatasetInfo(_datasetType, _IP, _datasetLocation, _datasetDescription, _encryptedURL, _cost);
        return ("account successfully created");
    }
    else{
        return "dataset already exist!!";
    }
    
    }
    
    //function for buying dataset or I should say accessing dataset Information
    function buyDataset(string _datasetType, address _sellerAddress){
        if(user_Accounts[msg.sender].accountBalance>=list_datasetInfo[_datasetType][msg.sender].cost){
            user_Accounts[msg.sender].accountBalance -= list_datasetInfo[_datasetType][msg.sender].cost;
            user_Accounts[_sellerAddress].accountBalance += list_datasetInfo[_datasetType][msg.sender].cost;
            list_datasetQos[_datasetType][_sellerAddress].listOfUsers[msg.sender].haveUsed = true;
        }
    }

    //helper function for giveFeeds
    function calcMul() returns (int){
        if(user_Accounts[msg.sender].numberOfFeeds>0){ //this will certain number in actual implementation
            if(user_Accounts[msg.sender].userReputation == 1){ //will be bounded by certain amount
                return 1;
            }
            else if(user_Accounts[msg.sender].userReputation == 2){
                return 2;
            }
            else if(user_Accounts[msg.sender].userReputation == -1){
                return -1;
            }
            else if(user_Accounts[msg.sender].userReputation == -2){
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
       if(list_datasetQos[_datasetType][_sellerAddress].listOfUsers[msg.sender].haveUsed==true){
        int multiplier = calcMul();
        int calculatedFeeds = countFeed(multiplier, feeds);
        list_datasetQos[_datasetType][_sellerAddress].datasetFeedBack += calculatedFeeds;
        if(calculatedFeeds > 0){
            user_Accounts[_sellerAddress].userReputation += 1;
        }
        else{
            user_Accounts[_sellerAddress].userReputation -= 1;
        }
        user_Accounts[_sellerAddress].numberOfFeeds += 1;
       }
    }
    
    function getDatasetInfo(string _datasetType)constant returns (string , string, string, string, uint, address, int){
        return (list_datasetInfo[_datasetType][msg.sender].IP,
                list_datasetInfo[_datasetType][msg.sender].datasetLocation,
                list_datasetInfo[_datasetType][msg.sender].datasetDescription,
                list_datasetInfo[_datasetType][msg.sender].encryptedURL,
                list_datasetInfo[_datasetType][msg.sender].cost,
                list_datasetInfo[_datasetType][msg.sender].owner,
                list_datasetQos[_datasetType][msg.sender].datasetFeedBack);
    }
    
  
    function getAccountInfo() constant returns (string,address, uint , int, bool){
        return(user_Accounts[msg.sender].userName,
                user_Accounts[msg.sender].userAddress,
                user_Accounts[msg.sender].accountBalance,
                user_Accounts[msg.sender].userReputation, 
                user_Accounts[msg.sender].doesExist);
    }

    function getDatasetTypeInfo(string _datasetType) constant returns(string, address, bool){
        return (list_datasetType[_datasetType].datasetType, 
                list_datasetType[_datasetType].listHead, 
                list_datasetType[_datasetType].doesExist);
    }
    
}




