pragma solidity ^0.4.24;

contract EtherTransferTo {
    function () public payable {
    }
    
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

contract EtherTransferFrom {
    
    EtherTransferTo private _instance;
    
    constructor() public {
        _instance = new EtherTransferTo();
    }
    
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
    
    function getBalanceOfInstance() public view returns (uint) {
        return _instance.getBalance();
    }
    
    function () public payable {
        // This is deprecated due to potential issues
        // Use transfer instead
        address(_instance).send(msg.value);
    }
}