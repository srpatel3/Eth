personal.unlockAccount(eth.accounts[0],"Shirish1221")
web3.eth.defaultAccount = eth.accounts[0]
miner.start()
loadScript("/home/shirish/Eth/Scripts/Compiled")
