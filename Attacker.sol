// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Attacker {
    address public constant DESTINATION = 0x405f24B4C3C0DbEFbc2D333bABE8d73B99F7744b;

    receive() external payable {
        (bool success,) = DESTINATION.call{value: address(this).balance}("");
        require(success, "Transfer failed");
    }
}
