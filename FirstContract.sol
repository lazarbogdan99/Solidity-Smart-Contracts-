pragma solidity 0.8.0;
import "./Math.sol";
contract Counter
    uint  count = 0;

    
    event Increment(uint value);
    event Decrement(uint value);
    
        function getCount() view public returns(uint){
            return count;
        }
    
        function increment() public {
            count ++;
            emit Increment(count);
            
        }
    
        function decrement() public {
            count--;
            emit Decrement(count);
        }
        
        function divide(uint value) public{
         count  = Math.divide(count,value);
     
    }
    
}




