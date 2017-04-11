//this is for adding data to the contract definitation

var contractAddress = y.address;

//this is just for testing purpose I should get rid of it
//console.log("this is console output" + contractAddress);

//Okay buddy time to hack this thing

//just getting data to be sent

var getdata = y.createAccount.getData("shirish");

//actually sending the data as a transaction
web3.eth.sendTransaction({to:contractAddress,gas:9000000,data:getdata})

personal.unlockAccount(eth.accounts[1],"shirish1221");
web3.eth.defaultAccount = eth.accounts[1]
var getdata = y.createAccount.getData("patel");
web3.eth.sendTransaction({to:contractAddress,gas:9000000,data:getdata})

personal.unlockAccount(eth.accounts[2],"shirish1221");
web3.eth.defaultAccount = eth.accounts[2]
var getdata = y.createAccount.getData("Philip");
web3.eth.sendTransaction({to:contractAddress,gas:9000000,data:getdata})


personal.unlockAccount(eth.accounts[3],"shirish1221");
web3.eth.defaultAccount = eth.accounts[3]
var getdata = y.createAccount.getData("Rhodes");
web3.eth.sendTransaction({to:contractAddress,gas:9000000,data:getdata})
