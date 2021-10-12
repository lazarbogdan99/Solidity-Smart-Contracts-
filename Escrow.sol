pragma solidity 0.5.0;

contract Trade{
    
    //create the escrow agent
    
    event Ready(address _seller ,uint256 _payment);
    address middleMan; 
    mapping(address => uint256) public payments;
    
    modifier onlyMiddleMan() {
        require(msg.sender == middleMan);
        _;
    }
    
    constructor () public{
     middleMan = msg.sender;
        
    }
    
    function pay (address seller)  public onlyMiddleMan payable{
        
        uint256 amount  = msg.value;
        payments[seller] = payments[seller] + amount;
    }
    
    function withdraw(address payable seller) public onlyMiddleMan{
        uint256 payment = payments[seller];
        payments[seller] = 0;
        seller.transfer(payment);
        
       emit Ready(seller,payment);
    }
    
    
    
}