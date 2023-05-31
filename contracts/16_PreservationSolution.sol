// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./Preservation.sol";

contract PreservationBreak {
    address public timeZone1Library;
    address public timeZone2Library;
    uint256 public storedTime;

    function setTime(uint256 _time) public {
        storedTime = _time;
    }
}
