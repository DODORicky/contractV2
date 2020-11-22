/*

    Copyright 2020 DODO ZOO.
    SPDX-License-Identifier: Apache-2.0

*/

pragma solidity 0.6.9;

import {IERC20} from "../intf/IERC20.sol";
import {SafeERC20} from "../lib/SafeERC20.sol";
import {Ownable} from "../lib/Ownable.sol";

contract SmartApprove is Ownable {
    using SafeERC20 for IERC20;
    address public smartSwap;

    function setSmartSwap(address _smartSwap) external onlyOwner {
        smartSwap = _smartSwap;
    }

    function getSmartSwap() public view returns (address) {
        return smartSwap;
    }

    function claimTokens(
        IERC20 token,
        address who,
        address dest,
        uint256 amount
    ) external {
        require(msg.sender == smartSwap, "Not SmartSwap Address, Access restricted");
        token.safeTransferFrom(who, dest, amount);
    }
}
