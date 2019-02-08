pragma solidity ^0.4.24;

contract Assignments {
    function returnFirstValue(uint a, uint b) public returns (uint) {
        return a;
    }
    
    function caller() public returns (uint) {
        return returnFirstValue({b:4, a:8});
    }
    
    function returnAllValues(uint a, uint b, uint c) public pure returns (uint, uint, uint) {
        return (a,b,c);
    }
    
    function callerAll() public pure returns (uint, uint, uint) {
        // Use of var keyword is deprecated, stay with the current supported functions
        var(x,y,z) = returnAllValues(4,5,6);
        (x,y) = (y,x);
        (x,) = returnAllValues(5,10,15);
        (,z) = returnAllValues(10,20,30);
        return (x,y,z);
    }
}