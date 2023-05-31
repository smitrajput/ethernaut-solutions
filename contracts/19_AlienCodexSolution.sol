// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

// import "./Preservation.sol";

contract AlienCodexTest {
    uint256 MAX = uint256(-1);
    // bytes32 public storedTime = keccak256(abi.encodePacked("1"));
    // uint256 public letSee = MAX - uint256(keccak256(abi.encodePacked("1"))) + 1;
    uint256 public codexIndex = MAX - uint256(keccak256(abi.encode(1))) + 1;

    //     function setTime(uint256 _time) public {
    //       storedTime = keccak256(1);
    //     }
}
