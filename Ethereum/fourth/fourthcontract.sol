pragma solidity ^0.4.24;


// Interface contract
interface Regulator {
    function checkValue(uint amount) external returns(bool);
    function loan() external returns(bool);	
}



// Bank contract
contract Bank is Regulator {
    uint private value;
	
	// owner attribute and modifiers
	address private owner;

	// Modifier executes this first line in ownerfunc and then
	// executes the rest of the lines in your function which 
	// replaces _; in the ownerfunc
	modifier ownerfunc {
	    require (owner == msg.sender);
		_;
	}
	
    // Constructor for this contract
    constructor(uint amount) public {
        value = amount;
		owner = msg.sender;
    }

    // Setter for this contract
	// Only the owner can deposit into account
    function deposit(uint amount) public ownerfunc {
        value += amount;
    }

    // withdraw function for this contract
	// Only the owner can withdraw from this account
    function withdraw(uint amount) public ownerfunc {
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
	    return value >= amount;
	}
	
    // Implement the interface
    function loan() public returns(bool) {
	    return value > 0;
	}
}



// FourthContract contract is of type Bank
// This is inheritance or extends type
contract FourthContract is Bank(10) {
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

// Test Contract
contract TestThrows {
    function testAssert() public pure {
	    assert(1 == 2);
	}
	
	function testRequire() public pure {
	    require (2 == 1);
	}
	
	function testRevert() public pure {
	    revert();
	}
	
	function testThrow() public pure {
	    throw;
	}
}