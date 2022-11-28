// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "hardhat/console.sol";

contract King {
    address payable king;
    uint256 public prize;
    address payable public owner;

    constructor() public payable {
        owner = msg.sender;
        king = msg.sender;
        prize = msg.value;
    }

    receive() external payable {
        // console.log("1");
        require(msg.value >= prize || msg.sender == owner);
        // console.log("2");
        king.transfer(msg.value);
        // console.log("3");
        king = msg.sender;
        prize = msg.value;
        // console.log("4");
    }

    function _king() public view returns (address payable) {
        return king;
    }
}
