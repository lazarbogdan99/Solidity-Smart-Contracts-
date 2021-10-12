pragma solidity 0.5.0;

contract CrowdFunding{
    
    address payable public targetAccount; 
    uint256 endDate = 1612188600;
    //uint256 endDate = 1643895117;
    
    constructor (address payable _targetAacount) public payable{
        
      targetAccount = _targetAacount;
        
        
    }
    
    function release() public{
        require(block.timestamp >= endDate);
        address (targetAccount).transfer(address(this).balance);
    }
    
}