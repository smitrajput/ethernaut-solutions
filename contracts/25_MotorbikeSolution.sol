// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract MotorbikeBomb {

  function annihilate() external payable {
    selfdestruct(0x640E35B6AfC3F6AD37bC14792536dA06e1C8cc19);
  }
}