pragma solidity ^0.4.24;

contract Random {

    function unsafeBlockRandom() 
        public view
        returns (uint) {
        return uint(blockhash(block.number-1)) % 100;
    }
    
    uint private _baseIncrement;
    
    function unsafeIncrementRandom() 
        public
        returns (uint) {
        return uint(keccak256(abi.encodePacked(_baseIncrement++))) % 100;
    }

}