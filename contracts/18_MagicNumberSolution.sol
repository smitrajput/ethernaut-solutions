// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract MagicNumberAttacker {

   address public solver;

  function createSolver() public {

    bytes memory bytecode = hex"600a600c600039600a6000f3602a60005260206000f3";
    bytes32 salt = 0;
    address localSolver;

    assembly {
        localSolver := create2(0, add(bytecode, 0x20), mload(bytecode), salt)
    }
    solver = localSolver;
  }
}