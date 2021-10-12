pragma solidity 0.8.0;

import "./Math.sol";

contract Libraries{
    uint256 public value;
    
    
    function calculate(uint256 value1, uint256 value2) public{
        value = Math.divide(value1,value2);
     
    }
}