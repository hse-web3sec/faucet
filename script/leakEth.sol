// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import "forge-std/console.sol";

import {Faucet} from "../src/Faucet.sol";

// forge script LeakEthScript --rpc-url hoodi --private-key $KEY --broadcast
// forge script LeakEthScript --rpc-url hoodi --private-key $KEY

contract LeakEthScript is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast();
        address faucet = 0x1BE5e8494D9a34c450a0fe91c87DD6184d67D34A;

        console.log("faucet balance:", faucet.balance);

        for (uint256 i = 0; i < 50; i++) {
            Faucet(payable(faucet)).claim(0x7646e7e5E871d0d33624321c3893A89Ca07f4f02);
        }

        console.log("faucet balance:", faucet.balance);

        vm.stopBroadcast();
    }
}
