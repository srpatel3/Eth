personal.unlockAccount(eth.accounts[0],"shirish1221")

web3.eth.defaultAccount = eth.accounts[0]

miner.start()

loadScript("/home/shirish/Eth/Scripts/Compiled")
//loadScript("/home/shirish/Eth/Scripts/test.js")
//console.log("this is console output" + y.address)
