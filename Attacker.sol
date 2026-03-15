// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Attacker {
    address public constant DESTINATION = <YOUR_EVM_WALLET_ADDRESS>;

    receive() external payable {
        (bool success,) = DESTINATION.call{value: address(this).balance}("");
        require(success, "Transfer failed");
    }
}
