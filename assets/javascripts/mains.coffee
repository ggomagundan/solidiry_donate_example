# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


contractAddress = "0xbbc636d684ba2a3f0e295ca16cb5d6e644e4eb29"
abi = [{"constant":true,"inputs":[],"name":"endBlock","outputs":[{"name":"","type":"uint256"}],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"newContract","type":"address"}],"name":"changeContract","outputs":[],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"startBlock","outputs":[{"name":"","type":"uint256"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"upgradeMaster","outputs":[{"name":"","type":"address"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"mainMaster","outputs":[{"name":"","type":"address"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"currentContract","outputs":[{"name":"","type":"address"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"currentVersion","outputs":[{"name":"","type":"string"}],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"_to","type":"address"},{"name":"_amount","type":"uint256"}],"name":"moveFund","outputs":[],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"newAddress","type":"address"}],"name":"changeUpgradeMaster","outputs":[],"payable":false,"type":"function"},{"constant":false,"inputs":[],"name":"donate","outputs":[],"payable":true,"type":"function"},{"inputs":[{"name":"_startBlock","type":"uint256"},{"name":"_endBlock","type":"uint256"}],"payable":false,"type":"constructor"},{"anonymous":false,"inputs":[{"indexed":false,"name":"_to","type":"address"},{"indexed":false,"name":"_amount","type":"uint256"}],"name":"fundedLog","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"name":"_to","type":"address"},{"indexed":false,"name":"_amount","type":"uint256"}],"name":"fundMovedLog","type":"event"}]
code = "6060604052341561000c57fe5b604051604080610ab5833981016040528080519060200190919080519060200190919050505b81811115156100415760006000fd5b33600260006101000a81548173ffffffffffffffffffffffffffffffffffffffff021916908373ffffffffffffffffffffffffffffffffffffffff16021790555033600360006101000a81548173ffffffffffffffffffffffffffffffffffffffff021916908373ffffffffffffffffffffffffffffffffffffffff16021790555081600081905550806001819055505b50505b6109d1806100e46000396000f300606060405236156100a2576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff168063083c6323146100a45780633d71c3af146100ca57806348cd4cb114610100578063600440cb146101265780636f0720d714610178578063721d7d8e146101ca5780639d888e861461021c578063b01217f4146102b5578063ea56a44d146102f4578063ed88c68e1461032a575bfe5b34156100ac57fe5b6100b4610334565b6040518082815260200191505060405180910390f35b34156100d257fe5b6100fe600480803573ffffffffffffffffffffffffffffffffffffffff1690602001909190505061033a565b005b341561010857fe5b610110610437565b6040518082815260200191505060405180910390f35b341561012e57fe5b61013661043d565b604051808273ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200191505060405180910390f35b341561018057fe5b610188610463565b604051808273ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200191505060405180910390f35b34156101d257fe5b6101da610489565b604051808273ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200191505060405180910390f35b341561022457fe5b61022c6104af565b604051808060200182810382528381815181526020019150805190602001908083836000831461027b575b80518252602083111561027b57602082019150602081019050602083039250610257565b505050905090810190601f1680156102a75780820380516001836020036101000a031916815260200191505b509250505060405180910390f35b34156102bd57fe5b6102f2600480803573ffffffffffffffffffffffffffffffffffffffff1690602001909190803590602001909190505061054d565b005b34156102fc57fe5b610328600480803573ffffffffffffffffffffffffffffffffffffffff16906020019091905050610722565b005b61033261081f565b005b60015481565b600260009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff16141580156103e65750600360009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff1614155b156103f15760006000fd5b80600460006101000a81548173ffffffffffffffffffffffffffffffffffffffff021916908373ffffffffffffffffffffffffffffffffffffffff1602179055505b5b50565b60005481565b600360009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1681565b600260009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1681565b600460009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1681565b60058054600181600116156101000203166002900480601f0160208091040260200160405190810160405280929190818152602001828054600181600116156101000203166002900480156105455780601f1061051a57610100808354040283529160200191610545565b820191906000526020600020905b81548152906001019060200180831161052857829003601f168201915b505050505081565b60006000600260009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff16141580156105fd5750600360009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff1614155b156106085760006000fd5b3073ffffffffffffffffffffffffffffffffffffffff163191508290503073ffffffffffffffffffffffffffffffffffffffff163183111515610714578373ffffffffffffffffffffffffffffffffffffffff166108fc3073ffffffffffffffffffffffffffffffffffffffff16319081150290604051809050600060405180830381858888f1935050505015610709577f43db714eca77ef6fb203c3caf4d3cbb8fafd5e3401148a64dab786f077621d6a8484604051808373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020018281526020019250505060405180910390a161070f565b60006000fd5b61071a565b60006000fd5b5b5b50505050565b600260009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff16141580156107ce5750600360009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff1614155b156107d95760006000fd5b80600360006101000a81548173ffffffffffffffffffffffffffffffffffffffff021916908373ffffffffffffffffffffffffffffffffffffffff1602179055505b5b50565b7fde8737e265220e47665662c77f11fc28ef3dedeb93abe70cb6e57b6570d6c24b3334604051808373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020018281526020019250505060405180910390a161089334610896565b5b565b600680548060010182816108aa9190610928565b916000526020600020900160005b33909190916101000a81548173ffffffffffffffffffffffffffffffffffffffff021916908373ffffffffffffffffffffffffffffffffffffffff160217905550506007805480600101828161090e9190610954565b916000526020600020900160005b83909190915055505b50565b81548183558181151161094f5781836000526020600020918201910161094e9190610980565b5b505050565b81548183558181151161097b5781836000526020600020918201910161097a9190610980565b5b505050565b6109a291905b8082111561099e576000816000905550600101610986565b5090565b905600a165627a7a7230582050093ac4b919daae65db5f86c917b5fe3801b8ed22ef41700f7095b33e41be4d0029"
dappContract = undefined

isActive = true

window.addEventListener 'load', ->
  # Checking if Web3 has been injected by the browser (Mist/MetaMask)
  if (typeof web3 != 'undefined')
    # Use Mist/MetaMask's provider
    window.web3 = new Web3(web3.currentProvider)
    startApp()
  else
    console.log('No web3? You should consider trying MetaMask!')
    # fallback - use your fallback strategy (local node / hosted node + in-dapp id mgmt / fail)
    window.web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"))
    startApp()
  #  Now you can start your app & access web3 freely:


startApp = ->

  dappContract = web3.eth.contract(abi)
  dapp = dappContract.at(contractAddress)
  window.dapp = dapp
  checkCurrentNetwork()
  document.getElementById('contractAddr').innerHTML = contractAddress
  $("#from-move-fund").val contractAddress
  web3.eth.getAccounts (err,res) ->
    console.log('Account' + res[0])
    $("#fund-from").val res[0]
    checkAddressBalance 0
  checkAddressBalance 1

  $("#change-contract").click ->
    new_contract_address = $("#new-contract-address").val()
    if web3.isAddress(new_contract_address)
      $("#from-move-fund").val $("#new-contract-address").val()
      $("#contractAddr").text $("#new-contract-address").val()
      $("#new-contract-address").val ""
      checkAddressBalance 1
    else
      alert "Check Contract Address"

  $("#change-address").click ->
    new_address = $("#fund-from").val()
    $(".address-balance").text "Check Now"
    if web3.isAddress(new_address)
      checkAddressBalance 0
    else
      alert "Check Contract Address"



  $("#do-fund").click ->
    if parseFloat($(".address-balance").text()) <= parseFloat($("#fund-amount").val())
      alert "Address Amount is not Enough"
    else
      dapp.donate {from: web3.eth.accounts[0], to: $("#contractAddr").val() , value: web3.toWei $("#fund-amount").val()  }, (err, res) ->
        tryTillResponse res, (error, receipt) ->
          alert 'done ' + res
  $("#move-fund").click ->
    if parseFloat($(".contract-balance").text()) <= parseFloat($("#amount-to-move").val())
      alert "Contract Amount is not Enough"
    else
      dapp.moveFund $("#moveFund").val(), $("#amount-to-move").val(), (err, res) ->
        tryTillResponse res, (error, receipt) ->
          alert 'done ' + res
 

# Reference : https://medium.com/@ggogun/web3js-%EB%A5%BC-%EC%9D%B4%EC%9A%A9%ED%95%9C-%EC%9D%B4%EB%8D%94%EB%A6%AC%EC%9B%80-%EB%84%A4%ED%8A%B8%EC%9B%8C%ED%81%AC-%EA%B5%AC%EB%B6%84-ea3dc9da43d8
checkCurrentNetwork = ->
  if !web3.isConnected()
    $(".connect-status").addClass "badge-danger"
    $(".connect-status").removeClass "badge-primary"
    $(".connect-status").text "DisConnected"
    $("#connect-modal").modal("show")

  current_network = web3.version.network
  switch(current_network)
    when "1"
      console.log("Current Network (" + current_network + ") : Main Network")
      $(".connect-network").text "Main Network"
    when "3"
      console.log("Current Network (" + current_network + ") : Ropsten Network")
      $(".connect-network").text "Ropsten Network"
    when "42"
      console.log("Current Network (" + current_network + ") : Kovan Network")
      $(".connect-network").text "Kovan Network"
    when "4"
      console.log("Current Network (" + current_network + ") : Rinkeby Network")
      $(".connect-network").text "Rinkeby Network"
    else
      console.log("Current Network (" + current_network + ") : Unknown Network or Local Network")
      $(".connect-network").text "Local Network"

checkAddressBalance = (index) ->
  if index is 0
    web3.eth.getBalance $("#fund-from").val(), (err, res) ->
      $(".address-balance").text (res / 1000000000000000000)
  else if index is 1
    web3.eth.getBalance $("#contractAddr").text(), (err, res) ->
      $("#contract-balance").text (res / 1000000000000000000)
  else

tryTillResponse = (txhash, done) ->
    document.getElementById('wait').innerHTML = 'waiting for the transaction to be mined ...'
    web3.eth.getTransactionReceipt txhash, (err, result) ->
        if (!err && !result)
          setTimeout ->
            tryTillResponse(txhash, done)
          , 500
        else
          document.getElementById('wait').innerHTML = ''
          log = document.createElement("div")
          log.className = "alert alert-primary"
          log.innerHTML = JSON.stringify(result)
          document.getElementById('log').appendChild(log)
          checkAddressBalance 0
          checkAddressBalance 1
          done(err,result)


window.contractAddress = contractAddress
window.abi = abi
window.startApp = startApp
window.code = code
