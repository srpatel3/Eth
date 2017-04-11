//adds datasetInformation
//this will be added to the list
var contractAddress = y.address;
personal.unlockAccount(eth.accounts[0],"shirish1221");
web3.eth.defaultAccount = eth.accounts[0]
miner.start();
var getdata = y.addDataset.getData("XX","192.168.98.67","Oxford MS","Traffic Data","www.something.com",500);
web3.eth.sendTransaction({to:contractAddress,gas:900000,data:getdata})

personal.unlockAccount(eth.accounts[1],"shirish1221");
web3.eth.defaultAccount = eth.accounts[1];
var getdata = y.addDataset.getData("XX","192.168.98.00","Tupelo MS","Online Cam Data","www.something.com",500);
web3.eth.sendTransaction({to:contractAddress,gas:900000,data:getdata})
