pragma solidity ^0.4.24;

// Bank contract
contract Bank {
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
        value -= amount;
    }

    // Getter for this contract
    function balance() public view returns(uint) {
        return value;
    }

    // Abstract function for this contract
    // No implementation, hence we cannot create this contract
    // Needs to be implemented to create a contract of Bank type
    function loan() public returns(bool);
}



// SecondContract contract is of type Bank
// This is inheritance or extends type
contract SecondContract is Bank(10) {
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

    // Implement the abstract method of Bank contract here
    function loan() public returns(bool) {
        return true;
    }
}