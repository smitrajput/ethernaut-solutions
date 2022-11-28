// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "@openzeppelin/contracts/math/SafeMath.sol";
import "hardhat/console.sol";

contract GatekeeperOne {
    using SafeMath for uint256;
    address public entrant;

    modifier gateOne() {
        require(msg.sender != tx.origin);
        _;
    }

    modifier gateTwo() {
        // console.log("gasLeft:", gasleft().mod(8191));
        // 8241 - 8291 //// >=50 <=60
        require(gasleft().mod(8191) == 0);
        // console.log("gasLeft:", gasleft());
        _;
    }
    // tx.origin = 0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266
    // uint16(tx.origin) = 0x2266 = 8806
    // 8806 -> HEX -> 2266
    // uint64(_gateKey) = 0xabcdef123456 2266
    //                    0xabcdef12 00002266
    //                    0xabcdef1200002266
    // uint32(uint64(_gateKey)) = 00002266
    modifier gateThree(bytes8 _gateKey) {
        require( // 0x00002266 == 0x2266
            uint32(uint64(_gateKey)) == uint16(uint64(_gateKey)),
            "GatekeeperOne: invalid gateThree part one"
        );
        require( // 0x00002266 != 0xabcdef1200002266
            uint32(uint64(_gateKey)) != uint64(_gateKey),
            "GatekeeperOne: invalid gateThree part two"
        );
        require( // 0x00002266 == 0x2266
            uint32(uint64(_gateKey)) == uint16(tx.origin),
            "GatekeeperOne: invalid gateThree part three"
        );
        _;
    }

    function enter(bytes8 _gateKey)
        public
        gateOne
        gateTwo
        gateThree(_gateKey)
        returns (bool)
    {
        entrant = tx.origin;
        return true;
    }
}
