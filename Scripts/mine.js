personal.unlockAccount(eth.accounts[0],"SHirish1221")

web3.eth.defaultAccount = eth.accounts[0]

miner.start()

loadScript("/home/shirish/Eth/Scripts/Compiled")
