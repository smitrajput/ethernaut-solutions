// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

// Simple library contract to set the time
contract LibraryContract {
    // stores a timestamp
    uint256 public storedTime;

    function setTime(uint256 _time) public {
        storedTime = _time;
    }
}
