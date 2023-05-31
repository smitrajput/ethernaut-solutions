// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract ForceSend {

  address payable force = 0x2aE8146632403C173294921fD8b981411d6ca562;

  function implode() public {
    selfdestruct(force);
  }
  receive() external payable {}
}