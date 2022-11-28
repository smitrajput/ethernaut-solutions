// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.0.0/contracts/token/ERC20/ERC20.sol";

contract DexTwoT1 is ERC20 {
    // string public constant name = 'NaughtCoin';
    // string public constant symbol = '0x0';
    // uint public constant decimals = 18;
    address public dex2 = 0x30756C8AD2dC469517C8ec56c56f2b2A2D386A9f;

    constructor() public ERC20("DexTwoT1", "DT1") {
        _setupDecimals(0);
        _mint(msg.sender, 10);
        _mint(dex2, 10);
    }

}
