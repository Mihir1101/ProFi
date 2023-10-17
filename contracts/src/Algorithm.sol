// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Algorithm {

    function normalize_between_zero_and_one (uint256 value) public pure returns (uint256) {
        while (value >= 1) {
            value /= 10;
        }
        while (value < 0) {
            value *= 10;
        }
        return value;
    }

    function check_size(uint256 value1 , uint256 value2) public pure returns (uint256) {
        if(value1 < value2) {
            return 1;
        } else {
            return 0;
        }
    }
    
}
