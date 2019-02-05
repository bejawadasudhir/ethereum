pragma solidity ^0.4.24;

contract FirstContract {
	string private name;
	uint private age;

	function setName(string newName) public {
		name = newName;
	}

	function getName() public view returns(string) {
		return name;
	}
}
