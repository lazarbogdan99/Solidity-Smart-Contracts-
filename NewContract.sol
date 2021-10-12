pragma solidity 0.8.0;

contract NewContract{
    mapping (uint => Person) public people;
    
  uint public  peopleCount = 0;
  
   address owner;
    uint256 openingTime = 1611664320;
   
   modifier onlyOwner(){
      require( msg.sender == owner);
      _;
   }
   modifier onlyWhileOpen(){
       require(block.timestamp >= openingTime);
       _;
   }
       
        struct Person{
            uint id;
            string _firstName;
            string _lastName;
            
        }
        
         constructor() public{
            owner = msg.sender;
        }
        
        
        function increment() internal {
            peopleCount++;
        }
    
    function addPerson(string memory _firstName, string memory _lastName) public onlyOwner onlyWhileOpen{
       increment();
        people[peopleCount] = Person(peopleCount,_firstName,_lastName);
    }
    
}