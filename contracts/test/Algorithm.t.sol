// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {Algorithm} from "../src/Algorithm.sol";

contract AlgorithmTest is Test {
    Algorithm public algorithm;

    function setUp() public {
        algorithm = new Algorithm(0xBAa256620622749f0381DA9539DEc3Ab40d3F793);
    }
}
