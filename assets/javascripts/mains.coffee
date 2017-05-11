# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


contractAddress = "0x103c6745ead3a63125f87aa33e679192a00cc433"
abi = [{"constant":true,"inputs":[],"name":"endBlock","outputs":[{"name":"","type":"uint256"}],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"newContract","type":"address"}],"name":"changeContract","outputs":[],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"startBlock","outputs":[{"name":"","type":"uint256"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"upgradeMaster","outputs":[{"name":"","type":"address"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"mainMaster","outputs":[{"name":"","type":"address"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"currentContract","outputs":[{"name":"","type":"address"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"currentVersion","outputs":[{"name":"","type":"string"}],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"newAddress","type":"address"}],"name":"changeUpgradeMaster","outputs":[],"payable":false,"type":"function"},{"constant":false,"inputs":[],"name":"donate","outputs":[],"payable":true,"type":"function"},{"inputs":[{"name":"_startBlock","type":"uint256"},{"name":"_endBlock","type":"uint256"}],"payable":false,"type":"constructor"},{"anonymous":false,"inputs":[{"indexed":false,"name":"_to","type":"address"},{"indexed":false,"name":"_amount","type":"uint256"}],"name":"fundLog","type":"event"}]
code = "6060604052341561000c57fe5b604051604080610896833981016040528080519060200190919080519060200190919050505b81811115156100415760006000fd5b33600260006101000a81548173ffffffffffffffffffffffffffffffffffffffff021916908373ffffffffffffffffffffffffffffffffffffffff16021790555033600360006101000a81548173ffffffffffffffffffffffffffffffffffffffff021916908373ffffffffffffffffffffffffffffffffffffffff16021790555081600081905550806001819055505b50505b6107b2806100e46000396000f30060606040523615610097576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff168063083c6323146100995780633d71c3af146100bf57806348cd4cb1146100f5578063600440cb1461011b5780636f0720d71461016d578063721d7d8e146101bf5780639d888e8614610211578063ea56a44d146102aa578063ed88c68e146102e0575bfe5b34156100a157fe5b6100a96102ea565b6040518082815260200191505060405180910390f35b34156100c757fe5b6100f3600480803573ffffffffffffffffffffffffffffffffffffffff169060200190919050506102f0565b005b34156100fd57fe5b6101056103ed565b6040518082815260200191505060405180910390f35b341561012357fe5b61012b6103f3565b604051808273ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200191505060405180910390f35b341561017557fe5b61017d610419565b604051808273ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200191505060405180910390f35b34156101c757fe5b6101cf61043f565b604051808273ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200191505060405180910390f35b341561021957fe5b610221610465565b6040518080602001828103825283818151815260200191508051906020019080838360008314610270575b8051825260208311156102705760208201915060208101905060208303925061024c565b505050905090810190601f16801561029c5780820380516001836020036101000a031916815260200191505b509250505060405180910390f35b34156102b257fe5b6102de600480803573ffffffffffffffffffffffffffffffffffffffff16906020019091905050610503565b005b6102e8610600565b005b60015481565b600260009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff161415801561039c5750600360009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff1614155b156103a75760006000fd5b80600460006101000a81548173ffffffffffffffffffffffffffffffffffffffff021916908373ffffffffffffffffffffffffffffffffffffffff1602179055505b5b50565b60005481565b600360009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1681565b600260009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1681565b600460009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1681565b60058054600181600116156101000203166002900480601f0160208091040260200160405190810160405280929190818152602001828054600181600116156101000203166002900480156104fb5780601f106104d0576101008083540402835291602001916104fb565b820191906000526020600020905b8154815290600101906020018083116104de57829003601f168201915b505050505081565b600260009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff16141580156105af5750600360009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff1614155b156105ba5760006000fd5b80600360006101000a81548173ffffffffffffffffffffffffffffffffffffffff021916908373ffffffffffffffffffffffffffffffffffffffff1602179055505b5b50565b7ffc2371305643a164508f32634b2d990a71e54656a5ced8d3da7df5122345739b3334604051808373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020018281526020019250505060405180910390a161067434610677565b5b565b6006805480600101828161068b9190610709565b916000526020600020900160005b33909190916101000a81548173ffffffffffffffffffffffffffffffffffffffff021916908373ffffffffffffffffffffffffffffffffffffffff16021790555050600780548060010182816106ef9190610735565b916000526020600020900160005b83909190915055505b50565b8154818355818115116107305781836000526020600020918201910161072f9190610761565b5b505050565b81548183558181151161075c5781836000526020600020918201910161075b9190610761565b5b505050565b61078391905b8082111561077f576000816000905550600101610767565b5090565b905600a165627a7a7230582025671712c8204401b649efb586b88ac42fd051d0e1043acae90ec0d06846363a0029"

dappContract = undefined
dapp = undefined

isActive = true

window.addEventListener 'load', ->
  # Checking if Web3 has been injected by the browser (Mist/MetaMask)
  if (typeof web3 != 'undefined')
    # Use Mist/MetaMask's provider
    window.web3 = new Web3(web3.currentProvider)
  else
    console.log('No web3? You should consider trying MetaMask!')
    # fallback - use your fallback strategy (local node / hosted node + in-dapp id mgmt / fail)
    window.web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"))
  #  Now you can start your app & access web3 freely:
  startApp()


startApp = ->

  dappContract = web3.eth.contract(abi)
  dapp = dappContract.at(contractAddress)
  checkCurrentNetwork()
  document.getElementById('contractAddr').innerHTML = contractAddress
  web3.eth.getAccounts (err,res) ->
    console.log('Account' + res[0])
    $("#fund-from").val res[0]

  $("#change-contract").click ->
    $("#contractAddr").text $("#contractaddress").val()
    $("#contractaddress").val ""

  $("#do-fund").click ->
    dapp.donate {from: web3.eth.accounts[0], to: $("#contractAddr").val() , value: web3.toWei $("#fund-amount").val()  }, (err, res) ->
      tryTillResponse res, (error, receipt) ->
        alert 'done ' + res

# Reference : https://medium.com/@ggogun/web3js-%EB%A5%BC-%EC%9D%B4%EC%9A%A9%ED%95%9C-%EC%9D%B4%EB%8D%94%EB%A6%AC%EC%9B%80-%EB%84%A4%ED%8A%B8%EC%9B%8C%ED%81%AC-%EA%B5%AC%EB%B6%84-ea3dc9da43d8
checkCurrentNetwork = ->
  current_network = web3.version.network
  switch(current_network)
    when "1"
      console.log("Current Network (" + current_network + ") : Main Network")
    when "3"
      console.log("Current Network (" + current_network + ") : Ropsten Network")
    when "42"
      console.log("Current Network (" + current_network + ") : Kovan Network")
    when "4"
      console.log("Current Network (" + current_network + ") : Rinkeby Network")
    else
      console.log("Current Network (" + current_network + ") : Unknown Network or Local Network")

tryTillResponse = (txhash, done) ->
    document.getElementById('wait').innerHTML = 'waiting for the transaction to be mined ...'
    web3.eth.getTransactionReceipt txhash, (err, result) ->
        if (!err && !result)
          setTimeout ->
            tryTillResponse(txhash, done)
          , 500
        else
          document.getElementById('wait').innerHTML = ''
          log = document.createElement("div.badge.badge-primary")
          log.innerHTML = JSON.stringify(result)
          document.getElementById('log').appendChild(log)
          done(err,result)


window.dapp = dapp
window.contractAddress = contractAddress
window.abi = abi
window.startApp = startApp
window.code = code
