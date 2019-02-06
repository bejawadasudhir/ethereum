pragma solidity ^0.4.24;

// This is just a contract, but not really a library
contract Libraries {
}

library IntExtended {
    function increment(uint _self) public pure returns (uint) {
	    return (_self+1);
	}
	
	function decrement(uint _self) public pure returns (uint) {
	    return (_self-1);
	}
	
	function incrementByValue(uint _self, uint _val) public pure returns (uint) {
	    return (_self + _val);
	}
	
	function decrementByValue(uint _self, uint _val) public pure returns (uint) {
	    return (_self - _val);
	}
}
