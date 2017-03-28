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
      int sellerReputation;
      uint numberOfFeeds;
    }
    
    
    
    //mappings for different structures
    mapping (string => type_dataset) list_datasetType;
    mapping (string => mapping(address=>datasetNode_info))list_datasetInfo;
    mapping (string => mapping (address => datasetNode_qos)) list_datasetQos;
    mapping (address => sellerAccounts) list_Accounts;
    
    
    function createAccount(string _sellerName, int _sellerReps)returns (string){
        if(list_Accounts[msg.sender].doesExist!=true){
            list_Accounts[msg.sender].sellerName = _sellerName;
            list_Accounts[msg.sender].sellerAddress = msg.sender;
            list_Accounts[msg.sender].accountBalance = 0;
            list_Accounts[msg.sender].sellerReputation = _sellerReps;
            list_Accounts[msg.sender].doesExist = true;
            return "account successfully created";
        }
        else{
            return "account with address already exist";
        }
    }
    
     function calcMul() returns (int){
      //if(list_Accounts[msg.sender].numberOfFeeds > 2){
        if(list_Accounts[msg.sender].sellerReputation>=0){
          if(list_Accounts[msg.sender].sellerReputation >= 0 && list_Accounts[msg.sender].sellerReputation < 1){
            return 1;
          }
          if(list_Accounts[msg.sender].sellerReputation>=1 && list_Accounts[msg.sender].sellerReputation <2){
              return 2;
          }
        } 
        else{
            if(list_Accounts[msg.sender].sellerReputation < 0 && list_Accounts[msg.sender].sellerReputation > -2){
            return -1;
          }
          if(list_Accounts[msg.sender].sellerReputation<=-2 && list_Accounts[msg.sender].sellerReputation >-3){
              return -2;
          }
        }
      //}
      //else{
    //    return 1;
     // }
    }
    
    
    //for giving feedback for Datasets
    function giveFeeds(int Feed)returns (int){
        int multiplier = calcMul();
        int temp = Feed/2;
        if(Feed>0){
            if(multiplier == 0){
                return Feed;
            }
            else if(multiplier == 1){
                return Feed + temp;
            }
            else if(multiplier == 2){
                return Feed + temp*2;  
            }
            else if(multiplier == -1){
                return Feed - temp/2;
            }
            else{
                return Feed - temp*2;
            }
        }
        //return multiplier;
    }

}

