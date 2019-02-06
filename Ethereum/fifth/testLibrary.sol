pragma solidity ^0.4.24;

// Local import from your contracts Libraries
import "browser/library.sol";

// Remote import from github
import "github.com/bejawadasudhir/ethereum/Ethereum/first/firstcontract.sol";

// Import a library and use it as an extension for contract
contract testLibrary is Libraries {
}

// Create a contract from remote Import
contract testRemote is FirstContract {
    constructor() public {
        setName("Remote Library");
        getName();
    }
}

contract testIntExtended {
    using IntExtended for uint;
    
    function testIncrement(uint val) public pure returns(uint) {
        return val.increment();
    }
    
    function testDecrement(uint val) public pure returns(uint) {
        return val.decrement();
    }
    
    function testIncrementByValue(uint val, uint amt) public pure returns(uint) {
        return val.incrementByValue(amt);
    }
    
    function testDecrementByValue(uint val, uint amt) public pure returns(uint) {
        return val.decrementByValue(amt);
    }
}
