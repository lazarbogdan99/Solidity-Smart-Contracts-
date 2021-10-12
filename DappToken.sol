pragma solidity 0.8.0;

contract myCoin{
    string public name = "MyCoin";
    string public symbol = "Earth";
    
    
    
    uint256 public totalSupply; 
    
    mapping(address => uint256) public balanceOf; // takes the adress from an account 
    mapping(address => mapping(address => uint256)) public allowance; // an account aporves another account to spent an amout of coins 
    
    
   
    
    
    
    event Aproval(address indexed _owner, address indexed _spender, uint256 _value); //everytime an aproval is done we are notified 
                                                                                    // and can be checked
    function MyCoin(uint256 _initailSupply) public {
        balanceOf[msg.sender] = _initailSupply;
        totalSupply = _initailSupply;
    }
    
         event Transfer(address indexed _from, address indexed _to, uint256 _value); //everytime a transfer is done we are notified 
                                                                                // and can be checked
    
        function transfer(address _to, uint256 _value)public returns(bool acomplished){
            require(balanceOf[msg.sender] >= _value); // if sender has enough tokens 
            
            balanceOf[msg.sender] -= _value; // removing coins form the sender account 
            balanceOf[_to] += _value; // adding coins to the reciever account
            emit Transfer(msg.sender, _to, _value); //emit notification for the current transfer
            
            return true;
            
        }
        
        function approve(address _spender, uint256 _value) public returns (bool acomplished){
            allowance[msg.sender][_spender] <= _value; // spender account can spend coins on the befalh of owner
            
            emit Aproval(msg.sender,_spender,_value); // emit notification when a transfer is approved 
            
            return true;
            
        }
        
        function transferFrom(address _from, address _to, uint256 _value) public returns (bool acomplished){ // transfers through third-parties
            require(_value <= balanceOf[_from]); // require the account to have enough coins
            require(_value <= allowance[_from][msg.sender]); //require the the allowance to be big enough 
                                                             //(not transfering more coins than the allowed amount)
            
            
            balanceOf[_from] -= _value; // removing coins form the sender account (third-party account)
            balanceOf[_to] += _value; // adding coins to the reciever account
            
            allowance[_from][msg.sender] -= _value;
            
           emit Transfer(_from, _to, _value); //emit notification for the current transfer
            
            return true;
        }
    }
    
