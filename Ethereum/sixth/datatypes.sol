pragma solidity ^0.4.0;

contract DataTypes {
    
    // Boolean data type
    bool myBool = false;
    
    // unsigned and integer data types
    int8 myInt = -128;
    uint8 myUInt = 255;
    
    // String and array data types
    string myString;
    uint8[] myStringArr;

    // byte data types
    byte myValue;
    bytes1 myBytes1; 
    bytes32 myBytes32;
    
    // fixed256x8 myFixed = 1; // 255.0
    // ufixed myFixed = 1;

    // Enumeration data types
    enum Action {ADD, REMOVE, UPDATE}
    Action myAction = Action.ADD;
    
    // Address data types
    address myAddress;
    
    // Ethereum address type
    function assignAddress() public {
        myAddress = msg.sender;
        myAddress.balance;
        myAddress.transfer(10);
    }
    
    // Playing with arrays
    uint[] myIntArr = [1,2,3];
    function arrFunc() public {
        myIntArr.push(1);
        myIntArr.length;
        myIntArr[0];
    }
    uint[10] myFixedArr;
    
    // Structures like in C
    struct Account {
        uint balance;
        uint dailyLimit;
    }
    Account myAccount;
    function structFunc() public {
        myAccount.balance = 100;
        myAccount.dailyLimit = 1000;
    }
    
    mapping (address => Account) _accounts;
    function () public payable {
        _accounts[msg.sender].balance += msg.value;
    }
    function getBalance() public view returns (uint) {
        return _accounts[msg.sender].balance;
    }
}