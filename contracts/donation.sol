pragma solidity ^0.4.11;

contract Donation  {


    uint256 public startBlock;
    uint256 public endBlock; 

    address public mainMaster;
    address public upgradeMaster;
    address public currentContract;
    string public currentVersion;
    
    address[] _giver;
    uint[] _values; 

    
    // Events used to log what's going on in the contract
    event fundedLog(address _to, uint _amount);
    event fundMovedLog(address _to, uint _amount);
    
    modifier isOwner(){
        if (msg.sender != mainMaster &&
        msg.sender != upgradeMaster ){
            throw;
        }
        _;
    }  
    
    // Constructor used to set parameters for the this specific vote
    function Donation(
                    uint256 _startBlock,
                    uint256 _endBlock) {

        
        //if (_mainMaster == 0) throw;
        //if (_upgradeMaster == 0) throw;
       // if (_startBlock <= block.number) throw;
        if (_endBlock   <= _startBlock) throw;
        
        mainMaster = msg.sender;
        upgradeMaster = msg.sender;
        startBlock = _startBlock;
        endBlock = _endBlock;
        currentContract = this;
        
       

    }
    
    function changeContract(address newContract) public
    isOwner()
    {
        currentContract = newContract;
    }
    
    function changeUpgradeMaster(address newAddress) public
    isOwner()
    {
        upgradeMaster = newAddress; 
    }

    function moveFund(address _to, uint _amount) isOwner {
        uint balance = this.balance;
        uint amount = _amount;
        if (_amount <= balance) {
            if (_to.send(amount)) {
                fundMovedLog(_to, _amount);
            } else {
                throw; 
            }
        } else { 
            throw;
        }
    } 
 
   
     function donate() payable {
        fundedLog(msg.sender, msg.value);
        addGiver(msg.value);
    }
    function addGiver(uint _amount) internal {
        _giver.push(msg.sender);
        _values.push(_amount);

    } 
    
   

}  