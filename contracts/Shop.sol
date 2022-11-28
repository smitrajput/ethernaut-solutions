// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "hardhat/console.sol";

interface Muyer {
    function price() external view returns (uint256);
}

contract Shop {
    uint256 public price = 100;
    bool public isSold;

    function buy() public {
        Muyer _buyer = Muyer(msg.sender);
        console.log(1);
        if (_buyer.price() >= price && !isSold) {
            console.log(2);
            isSold = true;
            console.log(3);
            price = _buyer.price();
            console.log(4);
        }
    }
}
