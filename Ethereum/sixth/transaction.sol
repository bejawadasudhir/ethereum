pragma solidity ^0.4.0;
contract Transaction {

	event senderLogger(address);
	event valueLogger(uint);

	address private owner;

	function Transaction() {
		owner = msg.sender;
	}

	modifier isOwner {
		require (owner == msg.sender);
		_;
	}

    modifier validValue {
		require (msg.value >= 1 ether);
		_;
	}

	// fallback function, this can be used to extract contract and sender information
	function () payable isOwner validValue {
		senderLogger(msg.sender);
		valueLogger(msg.value);
    }
}
