// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface IAlienOwner {
    function owner() external returns(address);
}

contract Owna {

  address public owner;
  address public alienOwner = 0xda5b3Fb76C78b6EdEE6BE8F11a1c31EcfB02b272;

  function setOwner() public {
    owner = IAlienOwner(alienOwner).owner();
  }
}