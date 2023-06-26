// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.15;

contract OptimizedRequire {
    // Do not modify these variables
    uint256 constant COOLDOWN = 1 minutes;
    uint256 lastPurchaseTime;
    error NotAbleToMint();

    // Optimize this function
    function purchaseToken() external payable {

        unchecked {
            if(msg.value != 0.1 ether){
            revert NotAbleToMint();
            }
            if( block.timestamp <= lastPurchaseTime + COOLDOWN){
                revert NotAbleToMint();
            }
            lastPurchaseTime = block.timestamp;
        }
        
        
        
        // mint the user a token
    }
}
