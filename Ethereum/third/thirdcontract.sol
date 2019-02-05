pragma solidity ^0.4.24;

// Interface contract
interface Regulator {
    function checkValue(uint amount) external returns(bool);
    function loan() external returns(bool);	
}

// Bank contract
contract Bank is Regulator {
    uint private value;

    // Constructor for this contract
    constructor(uint amount) public {
        value = amount;
    }

    // Setter for this contract
    function deposit(uint amount) public {
        value += amount;
    }

    // withdraw function for this contract
    function withdraw(uint amount) public {
	    if(checkValue(amount)) {
            value -= amount;
		}
    }

    // Getter for this contract
    function balance() public view returns(uint) {
        return value;
    }

	// Implement the interface
	function checkValue(uint amount) public returns(bool) {
	    return amount >= value;
	}
	
    // Implement the interface
    function loan() public returns(bool) {
	    return value > 0;
	}
}



// ThirdContract contract is of type Bank
// This is inheritance or extends type
contract ThirdContract is Bank(10) {
    // private variable of contract
    string private name;
    uint private age;
    
    // Setter function
    function setName(string newName) public {
        name = newName;
    }
    
    // Getter function
    function getName() public view returns(string) {
        return name;
    }
}