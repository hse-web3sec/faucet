// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import "forge-std/console.sol";

// forge script SendEthScript --rpc-url hoodi --private-key $KEY --broadcast

contract SendEthScript is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast();
        address faucet = 0x1BE5e8494D9a34c450a0fe91c87DD6184d67D34A;

        console.log("faucet balance:", faucet.balance);

        payable(faucet).transfer(1 ether);

        console.log("faucet balance:", faucet.balance);

        vm.stopBroadcast();
    }
}
