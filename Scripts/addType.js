//adds different types of datasets
var contractAddress = y.address;

var somethingdata = y.addDatasetType.getData("shirish");

personal.unlockAccount(eth.accounts[0],"shirish1221")
web3.eth.defaultAccount = eth.accounts[0]

miner.start()

web3.eth.sendTransaction({to:contractAddress, gas:900000,data:somethingdata})
somethingdata = y.addDatasetType.getData("XX");
web3.eth.sendTransaction({to:contractAddress, gas:900000,data:somethingdata})

somethingdata = y.addDatasetType.getData("lodu");
web3.eth.sendTransaction({to:contractAddress, gas:900000,data:somethingdata})

somethingdata = y.addDatasetType.getData("chhe");
web3.eth.sendTransaction({to:contractAddress, gas:900000,data:somethingdata})

