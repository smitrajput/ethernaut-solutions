// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface IDetectionBot {
    function handleTransaction(address user, bytes calldata msgData) external;
}

interface IForta {
    function setDetectionBot(address detectionBotAddress) external;

    function notify(address user, bytes calldata msgData) external;

    function raiseAlert(address user) external;
}

contract DetectionBot is IDetectionBot {
    address public forta = 0x68D44C7c91CA629EA0b9FE0FdDA669a145e7608B;

    function handleTransaction(address user, bytes calldata msgData) external override {
        IForta(forta).raiseAlert(user);
    }
}