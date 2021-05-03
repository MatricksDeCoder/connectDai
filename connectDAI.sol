// SPDX-License-Identifier: MIT
pragma solidity ^0.7.3;

import '@openzeppelin/contracts/tokens/ERC20/IERC20.sol';

contract MyContract {

  IERC20 public dai;
  mapping(address => uint) public balances;

  constructor(address _dai) {
    dai = IERC20(_dai);
  }

  /// @notice deposit DAI into contract
  /// @param amount the amount of DAI to deposit
  function deposit(uint amount) external {
    // requires approve() to have been called 
    dai.transferFrom(msg.sender, address(this), amount);
  }

  /// @notice withdraw DAI from contract
  /// @param amount the amount of DAI to deposit
  function withdraw(uint amount) external {
    require(balances[msg.sender] >= amount, 'amount too big');
    dai.transfer(msg.sender, amount);
  }

  //@todo Create and destroy a vault
}